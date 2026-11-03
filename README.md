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
browser and the default AgentConnex widget can be restored at any time.

If you edit `src.jsx`, rebuild the committed browser bundle with:

```bash
npm run build
```

## Deploy to Coolify

The included `Dockerfile` serves the committed static site with Nginx. No Node.js
installation, build command, environment variables, or persistent volumes are needed.
Rebuild `dist/app.js` before deploying any changes to `src.jsx`.

1. In Coolify, create a new application from this Git repository and select the
   branch containing the deployment files.
2. Select **Dockerfile** as the build pack, use `/` as the base directory, and
   `/Dockerfile` as the Dockerfile location.
3. Set **Ports Exposes** to `80` and configure your domain. Let Coolify manage
   HTTPS at its reverse proxy; the container serves HTTP internally.
4. Deploy. If enabling Coolify's HTTP health check, use `GET /` on port `80`
   with expected status `200`. The image also includes a Docker health check.

The site supports `/widget/` for browser-local widget settings and falls back to
the landing page for other application routes. Missing JavaScript and stylesheet
assets return `404`. Only public site files are copied into the image.

To validate the same deployment locally:

```bash
docker build -t yoma-bank-demo .
docker run --rm -p 8080:80 yoma-bank-demo
```

Visit `http://localhost:8080` and `http://localhost:8080/widget/`.
Widget settings are saved per browser and origin; configure them again if moving
to a new domain. The default AgentConnex widget needs no server-side credentials.

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
