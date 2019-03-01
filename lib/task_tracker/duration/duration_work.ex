defmodule TaskTracker.Duration.DurationWork do
  use Ecto.Schema
  import Ecto.Changeset


  schema "duration_work" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    belongs_to :task, TaskTracker.Tasks.Task
    belongs_to :user, TaskTracker.Users.User

    timestamps()
  end

  @doc false
  def changeset(duration_work, attrs) do
    duration_work
    |> cast(attrs, [:start_time, :end_time])
    |> validate_required([:start_time, :end_time])
  end
end
