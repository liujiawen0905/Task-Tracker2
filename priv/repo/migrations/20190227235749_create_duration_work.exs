defmodule TaskTracker.Repo.Migrations.CreateDurationWork do
  use Ecto.Migration

  def change do
    create table(:duration_work) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :task_id, references(:tasks, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:duration_work, [:user_id])
    create index(:duration_work, [:task_id])
  end
end
