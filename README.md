# OWASP WrongSecrets

[OWASP WrongSecrets](https://github.com/OWASP/wrongsecrets) by Jeroen Willemsen and the OWASP
WrongSecrets contributors: an application full of badly stored secrets, with challenges on
finding them. This repository runs its Docker variant with [Isoloom](https://www.isoloom.com):
[`isoloom.yml`](isoloom.yml) describes the machine, and the upstream source in
[`build/wrongsecrets/app/`](build/wrongsecrets/app) builds with upstream's own Dockerfile.

| Machine | Services |
| --- | --- |
| wrongsecrets | WrongSecrets on 8080, its MCP server on 8090 |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then open http://localhost:8080/. This is upstream's `-no-vault` Docker variant: the challenges
marked as needing Kubernetes, Vault or a cloud account (AWS, GCP, Azure) show as unavailable.
The first build takes several minutes (Maven and Node.js dependencies).

Differences from upstream's own image build, all in
[`build/wrongsecrets/Dockerfile`](build/wrongsecrets/Dockerfile):

- A first stage builds the jar from the source (`./mvnw package -DskipTests`, as upstream's CI
  does), since upstream's Dockerfile copies a jar built beforehand on the host.
- The build values upstream's release script passes for the published `-no-vault` image
  (`spring_profile=without-vault`, the challenge 4 build argument, and the build secret written
  to `/var/run/secrets2/secret.txt`) are set in the Dockerfile, as Isoloom passes no build
  arguments or secrets.

Lab guide: upstream's [README](build/wrongsecrets/app/README.md) and the hints in the app.
Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

AGPL-3.0, as WrongSecrets ([LICENSE](LICENSE)), copyright the OWASP WrongSecrets contributors.

Source offer (AGPL-3.0 section 13): anyone who interacts with this application over a network
can get its complete corresponding source, unchanged, from this repository
([`build/wrongsecrets/app/`](build/wrongsecrets/app), the release named in
[UPSTREAM.md](UPSTREAM.md)) together with the build files that produce the running image, or
from upstream at https://github.com/OWASP/wrongsecrets. The application is deliberately insecure:
keep it isolated.
