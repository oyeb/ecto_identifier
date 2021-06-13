# Changelog

# v0.2.0 Upgrade to [Nanoid][nanoid] v2 and support Ecto v3

**Note!** Default alphabet of nanoid was changed in
[v2.0.0](https://github.com/railsmechanic/nanoid/commit/662f67bab8bf7843f49e985147a36ca7f89a22e0),
the tilde (`~`) was replaced by dash (`-`). Refer upstream
[changelog](https://github.com/railsmechanic/nanoid#introducing-a-new-generator) about the new secure nanoids.

`ecto_identifier` uses the secure nanoids by default. Nanoid size and alphabet can be configured
[using `config.exs`](https://github.com/oyeb/ecto_identifier#how-should-i-configure-the-nanoids).

### Miscellaneous
- Remove `git_hooks` dependency.

# v0.1.0 BigBang!

New custom `Ecto.Type`
----------------------

`Ecto.Nanoid`, uses [`nanoid`][nanoid] to do its magic.

[nanoid]: https://github.com/railsmechanic/nanoid
[livedocs]: https://hexdocs.pm/ecto_identifier/