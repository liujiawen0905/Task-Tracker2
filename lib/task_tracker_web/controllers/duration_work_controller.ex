defmodule TaskTrackerWeb.DurationWorkController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Duration
  alias TaskTracker.Duration.DurationWork

  def index(conn, _params) do
    duration_work = Duration.list_duration_work()
    render(conn, "index.html", duration_work: duration_work)
  end

  def new(conn, _params) do
    changeset = Duration.change_duration_work(%DurationWork{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"duration_work" => duration_work_params}) do
    case Duration.create_duration_work(duration_work_params) do
      {:ok, duration_work} ->
        conn
        |> put_flash(:info, "Duration work created successfully.")
        |> redirect(to: Routes.duration_work_path(conn, :show, duration_work))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    duration_work = Duration.get_duration_work!(id)
    render(conn, "show.html", duration_work: duration_work)
  end

  def edit(conn, %{"id" => id}) do
    duration_work = Duration.get_duration_work!(id)
    changeset = Duration.change_duration_work(duration_work)
    render(conn, "edit.html", duration_work: duration_work, changeset: changeset)
  end

  def update(conn, %{"id" => id, "duration_work" => duration_work_params}) do
    duration_work = Duration.get_duration_work!(id)

    case Duration.update_duration_work(duration_work, duration_work_params) do
      {:ok, duration_work} ->
        conn
        |> put_flash(:info, "Duration work updated successfully.")
        |> redirect(to: Routes.duration_work_path(conn, :show, duration_work))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", duration_work: duration_work, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    duration_work = Duration.get_duration_work!(id)
    {:ok, _duration_work} = Duration.delete_duration_work(duration_work)

    conn
    |> put_flash(:info, "Duration work deleted successfully.")
    |> redirect(to: Routes.duration_work_path(conn, :index))
  end
end
