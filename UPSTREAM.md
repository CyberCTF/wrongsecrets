# Upstream

| Dir | Repository | Version | Commit | Licence |
| --- | --- | --- | --- | --- |
| build/wrongsecrets/app | https://github.com/OWASP/wrongsecrets | v1.14.1 | 5d9ffc5ffcd8d38f46e8deb757468c42bb4a9d39 | AGPL-3.0 |

`build/wrongsecrets/app/` is that release, unchanged, without its Git history.
`build/wrongsecrets/Dockerfile` is upstream's Dockerfile with a jar-building stage in front and
the build values of upstream's release script; its header comment lists every difference. To
update, replace `build/wrongsecrets/app/` with a newer release, then this table and the version
in the Dockerfile's `argBasedVersion` (it names the jar).
