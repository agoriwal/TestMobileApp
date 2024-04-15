*** Settings ***
Library      AppiumLibrary

Resource    ../resources/resource.robot
Resource    ../resources/android_homepage_keywords.robot
Resource    ../resources/android_user_profile_details_page.robot

#Test Setup      Open Application
#Test Teardown   Close Application

*** Test Cases ***
Verify_HomeLanding_Page
    Open Spotify music app
    User log in with email id and password
    User lands on home page
    By default user should land on Home tab
    If user click on Search icon he should land on search tab      Search
    If user click on Your Library he should land on your library page      Your Library
    If user click on Premium he should land on premium tab

#Verify_User_Profile_Page_Details
#    User clicks on the User Profile icon
#    Lands on View Profile page
#    After clicking on View Profile button user lands on user profile details page
#    User clicks on the three dots icon beside edit button
#    Receives a side up screen from the bottom
#    Clicking on Edit button lands on Edit Profile page
#    After clicking on close button lands on user profile details page
#    Clicking back button on user profile details takes to Home page

#Verify each song category has no duplicate songs and must not be empty

#Verify_Search_Result_On_Search_tab
#   If user click on Search icon he should land on search tab   Search
#   User enter the text and click on search     NEW RELEASES
#   Search result contains list of playlist  NEW RELEASES
#
#Verify_Back_Button_Function
#    Click on Back button on List of playlist page

Create_New_Playlist
    Create_New_Playlist     DEMO-PLAY-LIST
    Add_Songs_To_Playlist
    Playlist_Should_Display_In_User_Profile_Page
    New_Playlist_Created_Is_Displayed       DEMO-PLAY-LIST

Delete_PlayList
    Delete_PlayList_Library_Page
    Scroll_To