# geosdata-workers

[HEAD-Geosdata-DevOps] EC2 t4g.nano workers stack.

## Services

| Service | Port | Purpose |
|---|---|---|
| Redis 7 | 6379 | Cache layer + rate limiting (Pagao + APIs) |
| Umami | 3000 | Self-hosted analytics (7+ sites) |
| Uptime Kuma | 3001 | Independent monitoring (DO VPS + services) |

## Host

- Provider: AWS EC2
- Instance: t4g.nano (ARM64 Graviton)
- IP: 13.221.227.58
- Region: us-east-1a

## Setup

```bash
# 1. SSH into instance
ssh -i ~/.vault-secrets/geosdata-ec2.pem ec2-user@13.221.227.58

# 2. Run setup script (once)
bash setup.sh

# 3. Create .env from example
cp .env.example .env && nano .env

# 4. Start stack
docker-compose up -d
```

## Secrets

Stored in `~/.vault-secrets/.env` (local) — never commit `.env`.
