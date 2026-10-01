# Yoma Bank one-page demo

A responsive, static recreation of the supplied Yoma Bank landing page. The
browser-ready JavaScript bundle is committed in `dist/app.js`, so deployment
does not require Node.js or an npm install.

## Run locally

```bash
npm run dev
```

Then open <http://localhost:4173>.

The landing page loads the configured chat widget. Open <http://localhost:4173/widget>
to paste and save a replacement widget script tag. The setting is stored in the
browser and the default ApiToolz widget can be restored at any time.

If you edit `src.jsx`, rebuild the committed browser bundle with:

```bash
npm run build
```

## Deploy to Render

The repository includes a Render Blueprint in `render.yaml` and can be deployed
without changing any settings:

1. Push this repository to GitHub, GitLab, or Bitbucket.
2. In the Render Dashboard, select **New > Blueprint**.
3. Connect the repository and approve the `yoma-bank-demo` service.
4. Render publishes the repository root as a static site. No package install or
   JavaScript compilation runs during deployment because `dist/app.js` is
   already committed.

For a manual **Static Site** setup instead, use these values:

| Setting | Value |
| --- | --- |
| Build command | `echo "Using the committed static bundle"` |
| Publish directory | `.` |

The Blueprint also includes a catch-all rewrite to `index.html`, pull request
previews, and basic security response headers.
