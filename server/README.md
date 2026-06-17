# AI Chat — Server

Supabase backend for the AI Chat app, using Edge Functions to proxy requests to OpenAI.

## Structure

```
server/
└── supabase/
    ├── config.toml
    └── functions/
        └── send_message/    # Edge Function (Deno/TypeScript)
            ├── index.ts
            ├── system_prompt.ts
            └── deno.json
```

## Stack

- [Supabase](https://supabase.com) (Auth, Edge Functions)
- [Deno](https://deno.land) / TypeScript for Edge Functions
- [OpenAI API](https://platform.openai.com)

## Setup

1. Install the [Supabase CLI](https://supabase.com/docs/guides/cli).

2. Start the local Supabase stack:
   ```bash
   supabase start
   ```

3. Set environment variables:

   **Local development** — create `supabase/.env`:
   ```
   OPENAI_API_KEY=your_openai_api_key
   ```

   **Deployed project** — use the CLI:
   ```bash
   supabase secrets set OPENAI_API_KEY=your_openai_api_key
   ```

4. Serve functions locally:
   ```bash
   supabase functions serve
   ```

5. Deploy the Edge Function:
   ```bash
   supabase functions deploy send_message
   ```

## Usage

Send a POST request to the `send_message` function:

```bash
curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/send_message' \
  --header 'apiKey: <your_publishable_key>' \
  --data '{"message":"Hello!"}'
```
