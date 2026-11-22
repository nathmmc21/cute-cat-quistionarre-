# Purrfect Questions

A tiny interactive questionnaire hosted by a very pettable cat. Visitors answer a few questions, name the cat, get a "cat vibe" result, and can save a keepsake image of their answers.

**[Live demo](https://YOUR-USERNAME.github.io/purrfect-questions/)**

![Purrfect Questions screenshot](docs/screenshot.png)

## Features

- Seven questions across three types: yes/no, multiple choice, and free text
- Custom cat name with a live name tag on the cat
- Clickable cat with a pet counter that affects the final result
- Personalized "cat vibe" result based on the answers
- Copy answers to the clipboard or download a keepsake PNG (drawn with the Canvas API)
- Optional sound effects built with the Web Audio API, off by default
- Keyboard shortcuts, visible focus states, ARIA progress bar, and reduced-motion support
- Responsive layout from phones to desktop
- Answers saved to Supabase when a visitor finishes

## Built with

- HTML, CSS, and vanilla JavaScript in a single file, no build step or framework
- [Supabase](https://supabase.com) (Postgres with row-level security) for storing responses
- GitHub Pages for hosting

## How it works

Questions are defined in one `QUESTIONS` array, and the interface is rendered from it, so adding a question means adding one object. When a visitor finishes, the page sends their answers to Supabase through its REST API using a publishable key. Row-level security allows inserts only, so visitors can add a response but cannot read anyone else's.

## Run it locally

No install needed. Download the repo and open `index.html` in a browser.

## Set up your own Supabase backend

1. Create a free project at [supabase.com](https://supabase.com).
2. Run the SQL in [`supabase/schema.sql`](supabase/schema.sql) in the SQL Editor.
3. In `index.html`, replace `SUPABASE_URL` and `SUPABASE_KEY` with your project URL and publishable key.

Never put a `service_role` key in the page. Only the publishable key belongs in client code.

## Customize

- **Questions:** edit the `QUESTIONS` array near the top of the script. Supported types are `binary`, `choice`, and `text`.
- **Cat name:** the choice question with `role: "catName"` controls the name tag. Set `allowCustom: true` to let visitors type their own.
- **Colors and fonts:** change the CSS variables in `:root`.

## Privacy

Answers are stored in Supabase when a visitor completes the questionnaire. No names, emails, or tracking are collected unless a visitor types them into an answer.

## Project structure

```
.
├── index.html          # the whole app
├── supabase/
│   └── schema.sql      # table and security policy
└── docs/
    └── screenshot.png  # preview image
```

## License

MIT, see [LICENSE](LICENSE).
