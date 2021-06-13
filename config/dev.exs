use Mix.Config

config :git_hooks,
  verbose: true,
  hooks: [
    pre_commit: [
      mix_tasks: [
        "format --check-formatted"
      ]
    ],
    post_commit: [
      verbose: true,
      mix_tasks: [
        "credo --strict"
      ]
    ]
  ]
