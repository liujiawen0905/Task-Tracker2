defmodule TaskTrackerWeb.DurationWorkControllerTest do
  use TaskTrackerWeb.ConnCase

  alias TaskTracker.Duration

  @create_attrs %{end_time: ~N[2010-04-17 14:00:00], start_time: ~N[2010-04-17 14:00:00]}
  @update_attrs %{end_time: ~N[2011-05-18 15:01:01], start_time: ~N[2011-05-18 15:01:01]}
  @invalid_attrs %{end_time: nil, start_time: nil}

  def fixture(:duration_work) do
    {:ok, duration_work} = Duration.create_duration_work(@create_attrs)
    duration_work
  end

  describe "index" do
    test "lists all duration_work", %{conn: conn} do
      conn = get(conn, Routes.duration_work_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Duration work"
    end
  end

  describe "new duration_work" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.duration_work_path(conn, :new))
      assert html_response(conn, 200) =~ "New Duration work"
    end
  end

  describe "create duration_work" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.duration_work_path(conn, :create), duration_work: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.duration_work_path(conn, :show, id)

      conn = get(conn, Routes.duration_work_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Duration work"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.duration_work_path(conn, :create), duration_work: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Duration work"
    end
  end

  describe "edit duration_work" do
    setup [:create_duration_work]

    test "renders form for editing chosen duration_work", %{conn: conn, duration_work: duration_work} do
      conn = get(conn, Routes.duration_work_path(conn, :edit, duration_work))
      assert html_response(conn, 200) =~ "Edit Duration work"
    end
  end

  describe "update duration_work" do
    setup [:create_duration_work]

    test "redirects when data is valid", %{conn: conn, duration_work: duration_work} do
      conn = put(conn, Routes.duration_work_path(conn, :update, duration_work), duration_work: @update_attrs)
      assert redirected_to(conn) == Routes.duration_work_path(conn, :show, duration_work)

      conn = get(conn, Routes.duration_work_path(conn, :show, duration_work))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, duration_work: duration_work} do
      conn = put(conn, Routes.duration_work_path(conn, :update, duration_work), duration_work: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Duration work"
    end
  end

  describe "delete duration_work" do
    setup [:create_duration_work]

    test "deletes chosen duration_work", %{conn: conn, duration_work: duration_work} do
      conn = delete(conn, Routes.duration_work_path(conn, :delete, duration_work))
      assert redirected_to(conn) == Routes.duration_work_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.duration_work_path(conn, :show, duration_work))
      end
    end
  end

  defp create_duration_work(_) do
    duration_work = fixture(:duration_work)
    {:ok, duration_work: duration_work}
  end
end
