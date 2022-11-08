# Tezos Nodes Health Check

Simple page to check nodes health

## Install

```
pnpm i
```

## Dev

```sh
pnpm start
```

## Deployment

Now deployed with [actions-gh-pages](https://github.com/peaceiris/actions-gh-pages)

- Create a `gh-pages` branch
- configure the repo to Deploy from this branch
- add a `PUBLIC_PATH` secret with the GitHub repository name as value (`/nodes-health/`)

This project is based on a [template](https://github.com/jihchi/vitejs-template-react-rescript)
