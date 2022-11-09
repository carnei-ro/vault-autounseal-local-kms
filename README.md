# Vault Auto Unseal with AWS Local KMS

```bash
gpg --export "Leandro Carneiro" | base64 | tee "vault-1/my-public-gpg.asc"
docker-compose up -d
docker exec -it $(basename $PWD)-vault-1 sh -c "export VAULT_ADDR=http://127.0.0.1:8200; vault operator init -format=json -recovery-shares=1 -recovery-threshold=1 -recovery-pgp-keys=/vault/data/my-public-gpg.asc"
open http://localhost:8200/ui/
```
