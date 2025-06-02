require "application_system_test_case"

class GoalsTest < ApplicationSystemTestCase
  setup do
    @goal = goals(:one)
  end

  test "visiting the index" do
    visit goals_url
    assert_selector "h1", text: "Goals"
  end

  test "should create goal" do
    visit goals_url
    click_on "New goal"

    check "Accomplished" if @goal.accomplished
    fill_in "Date", with: @goal.date
    fill_in "Details", with: @goal.details
    fill_in "Goal", with: @goal.goal
    click_on "Create Goal"

    assert_text "Goal was successfully created"
    click_on "Back"
  end

  test "should update Goal" do
    visit goal_url(@goal)
    click_on "Edit this goal", match: :first

    check "Accomplished" if @goal.accomplished
    fill_in "Date", with: @goal.date.to_s
    fill_in "Details", with: @goal.details
    fill_in "Goal", with: @goal.goal
    click_on "Update Goal"

    assert_text "Goal was successfully updated"
    click_on "Back"
  end

  test "should destroy Goal" do
    visit goal_url(@goal)
    click_on "Destroy this goal", match: :first

    assert_text "Goal was successfully destroyed"
  end
end
