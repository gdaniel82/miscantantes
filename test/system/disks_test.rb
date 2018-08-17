require "application_system_test_case"

class DisksTest < ApplicationSystemTestCase
  setup do
    @disk = disks(:one)
  end

  test "visiting the index" do
    visit disks_url
    assert_selector "h1", text: "Disks"
  end

  test "creating a Disk" do
    visit disks_url
    click_on "New Disk"

    fill_in "Description", with: @disk.description
    fill_in "Name", with: @disk.name
    fill_in "Singer", with: @disk.singer
    click_on "Create Disk"

    assert_text "Disk was successfully created"
    click_on "Back"
  end

  test "updating a Disk" do
    visit disks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @disk.description
    fill_in "Name", with: @disk.name
    fill_in "Singer", with: @disk.singer
    click_on "Update Disk"

    assert_text "Disk was successfully updated"
    click_on "Back"
  end

  test "destroying a Disk" do
    visit disks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Disk was successfully destroyed"
  end
end
