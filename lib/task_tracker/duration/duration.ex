defmodule TaskTracker.Duration do
  @moduledoc """
  The Duration context.
  """

  import Ecto.Query, warn: false
  alias TaskTracker.Repo

  alias TaskTracker.Duration.DurationWork

  @doc """
  Returns the list of duration_work.

  ## Examples

      iex> list_duration_work()
      [%DurationWork{}, ...]

  """
  def list_duration_work do
    Repo.all(DurationWork)
  end

  @doc """
  Gets a single duration_work.

  Raises `Ecto.NoResultsError` if the Duration work does not exist.

  ## Examples

      iex> get_duration_work!(123)
      %DurationWork{}

      iex> get_duration_work!(456)
      ** (Ecto.NoResultsError)

  """
  def get_duration_work!(id), do: Repo.get!(DurationWork, id)

  @doc """
  Creates a duration_work.

  ## Examples

      iex> create_duration_work(%{field: value})
      {:ok, %DurationWork{}}

      iex> create_duration_work(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_duration_work(attrs \\ %{}) do
    %DurationWork{}
    |> DurationWork.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a duration_work.

  ## Examples

      iex> update_duration_work(duration_work, %{field: new_value})
      {:ok, %DurationWork{}}

      iex> update_duration_work(duration_work, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_duration_work(%DurationWork{} = duration_work, attrs) do
    duration_work
    |> DurationWork.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DurationWork.

  ## Examples

      iex> delete_duration_work(duration_work)
      {:ok, %DurationWork{}}

      iex> delete_duration_work(duration_work)
      {:error, %Ecto.Changeset{}}

  """
  def delete_duration_work(%DurationWork{} = duration_work) do
    Repo.delete(duration_work)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking duration_work changes.

  ## Examples

      iex> change_duration_work(duration_work)
      %Ecto.Changeset{source: %DurationWork{}}

  """
  def change_duration_work(%DurationWork{} = duration_work) do
    DurationWork.changeset(duration_work, %{})
  end
end
