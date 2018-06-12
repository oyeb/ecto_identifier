defmodule EctoIdentifier.TestRepo.Migrations.CreatePostsTableWithNanoid do
  use Ecto.Migration

  def change do
    create(table(:posts_nanoid)) do
      add(:number, :string, comments: "the nanoid field")
    end
  end
end
