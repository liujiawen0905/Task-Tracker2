defmodule TaskTracker.DurationTest do
  use TaskTracker.DataCase

  alias TaskTracker.Duration

  describe "duration_work" do
    alias TaskTracker.Duration.DurationWork

    @valid_attrs %{end_time: ~N[2010-04-17 14:00:00], start_time: ~N[2010-04-17 14:00:00]}
    @update_attrs %{end_time: ~N[2011-05-18 15:01:01], start_time: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{end_time: nil, start_time: nil}

    def duration_work_fixture(attrs \\ %{}) do
      {:ok, duration_work} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Duration.create_duration_work()

      duration_work
    end

    test "list_duration_work/0 returns all duration_work" do
      duration_work = duration_work_fixture()
      assert Duration.list_duration_work() == [duration_work]
    end

    test "get_duration_work!/1 returns the duration_work with given id" do
      duration_work = duration_work_fixture()
      assert Duration.get_duration_work!(duration_work.id) == duration_work
    end

    test "create_duration_work/1 with valid data creates a duration_work" do
      assert {:ok, %DurationWork{} = duration_work} = Duration.create_duration_work(@valid_attrs)
      assert duration_work.end_time == ~N[2010-04-17 14:00:00]
      assert duration_work.start_time == ~N[2010-04-17 14:00:00]
    end

    test "create_duration_work/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Duration.create_duration_work(@invalid_attrs)
    end

    test "update_duration_work/2 with valid data updates the duration_work" do
      duration_work = duration_work_fixture()
      assert {:ok, %DurationWork{} = duration_work} = Duration.update_duration_work(duration_work, @update_attrs)
      assert duration_work.end_time == ~N[2011-05-18 15:01:01]
      assert duration_work.start_time == ~N[2011-05-18 15:01:01]
    end

    test "update_duration_work/2 with invalid data returns error changeset" do
      duration_work = duration_work_fixture()
      assert {:error, %Ecto.Changeset{}} = Duration.update_duration_work(duration_work, @invalid_attrs)
      assert duration_work == Duration.get_duration_work!(duration_work.id)
    end

    test "delete_duration_work/1 deletes the duration_work" do
      duration_work = duration_work_fixture()
      assert {:ok, %DurationWork{}} = Duration.delete_duration_work(duration_work)
      assert_raise Ecto.NoResultsError, fn -> Duration.get_duration_work!(duration_work.id) end
    end

    test "change_duration_work/1 returns a duration_work changeset" do
      duration_work = duration_work_fixture()
      assert %Ecto.Changeset{} = Duration.change_duration_work(duration_work)
    end
  end
end
