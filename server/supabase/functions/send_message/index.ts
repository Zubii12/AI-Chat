import "@supabase/functions-js/edge-runtime.d.ts";
import { withSupabase } from "@supabase/server";

interface OutputItem {
  type: string;
  content?: ContentItem[];
}

interface ContentItem {
  type: string;
  text?: string;
}

interface OpenAIResponse {
  output_text?: string;
  output?: OutputItem[];
}

function parseResponse(data: OpenAIResponse) {
  if ("output_text" in data && data.output_text) {
    return data.output_text;
  }

  if ("output" in data && data.output !== undefined) {
    const text = data.output
      .flatMap((item) => item.content ?? [])
      .filter((item) => item.type === "output_text" && item.text !== undefined)
      .map((item) => item.text)
      .join("");

    if (text !== "") {
      return text;
    }
  }

  throw Error("OPENAI error: response did not include final text");
}

export default {
  fetch: withSupabase({ auth: ["publishable"] }, async (req, _) => {
    try {
      if (req.method !== "POST") {
        return new Response("Method not allowed", { status: 405 });
      }

      const openaiKey = Deno.env.get("OPENAI_API_KEY");

      if (!openaiKey) {
        return Response.json(
          { error: "OPENAI API Key not set" },
          { status: 500 },
        );
      }

      const body = await req.json();

      const response = await fetch(
        "https://api.openai.com/v1/responses",
        {
          method: "POST",
          headers: {
            "Authorization": `Bearer ${openaiKey}`,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            model: "gpt-4o-mini",
            input: messages,
            temperature: 0.7,
            text: { format: { type: "json_object" } },
          }),
        },
      );

      if (!response.ok) {
        return Response.json(
          { error: await response.text() },
          { status: response.status },
        );
      }

      const data = await response.json();

      const textResult = parseResponse(data);

      console.log("OpenAI response:", data);

      return Response.json(textResult);
    } catch (error) {
      console.error("Error in send_message function:", error);

      return Response.json(
        { error: "Internal server error" },
        { status: 500 },
      );
    }
  }),
};
