*** Settings ***
Library     AppiumLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***

#*** Test Variables ***
&{USER-DETAILS}     email=agoriwale@gmail.com   password=test@4321

${LOGIN-BUTTON}             //android.widget.Button[@text="Log in"]
${ENTER-USERNAME}           //android.widget.EditText[@resource-id="com.spotify.music:id/username_text"]
${ENTER-PASSWORD}           //android.widget.EditText[@resource-id="com.spotify.music:id/password_text"]
${Login}                    //android.widget.Button[@resource-id="com.spotify.music:id/login_button"]

${ICON-HOME}                //android.widget.ImageView[@content-desc="Home"]
${HEADER-HOME}              //android.widget.TextView[@resource-id="com.spotify.music:id/section_heading1_title" and @text="To get you started"]

${ICON-SEARCH}              //android.widget.ImageView[@content-desc="Search"]
${HEADER-SEARCH}            //android.widget.TextView[@resource-id="com.spotify.music:id/title"]

${ICON-YOUR}                //android.widget.ImageView[@content-desc="Your Library"]
${HEADER-YOUR-LIBRARY}      //android.widget.TextView[@content-desc="Your Library Heading"]

${ICON-PREMIUM}             //android.widget.ImageView[@content-desc="Premium" and @resource-id="com.spotify.music:id/bottom_navigation_item_icon"]
#${HEADER-PREMIUM}           //android.widget.TextView[@resource-id="com.spotify.music:id/logo_text"]

${SEARCH-TEXT-BOX}          //android.widget.TextView[@content-desc="Search for something to listen to"]
${ENTER-SEARCH-TEXT}        //android.widget.EditText[@resource-id="com.spotify.music:id/query"]

${songsName}                //android.widget.GridView[@resource-id="com.spotify.music:id/search_body"]//android.widget.TextView[@resource-id="com.spotify.music:id/title"]

${SEARCH-BACK-BUTTON}       //android.widget.ImageButton[@content-desc="Cancel"]

${CREATE-PLAYLIST-ICON}     //android.widget.ImageView[@content-desc="Create playlist"]
${CREATE-PLAYLIST}          //android.widget.TextView[@resource-id="com.spotify.music:id/title" and @text="Playlist"]
${NAME-CREATE-PLAYLIST}     //android.widget.EditText[@content-desc="Add a playlist name"]
${BUTTON-CREATE-PLAYLIST}   //android.widget.Button[@resource-id="com.spotify.music:id/continue_button"]
${NAME-NEW-PLAYLIST}        (//android.widget.TextView[@resource-id='com.spotify.music:id/title'])[1]
${ADD-TO-PLAYLIST}          //android.widget.Button[@resource-id="com.spotify.music:id/action_button"]
${PLAYLIST-ITEM-ONE}        (//android.widget.ImageButton[@content-desc="Add item"])[1]
${PLAYLIST-ITEM-TWO}        (//android.widget.ImageButton[@content-desc="Add item"])[9]
${PLAYLIST-ITEM-THREE}      (//android.widget.ImageButton[@content-desc="Add item"])[5]
${BUTTON-BACK-PLAYLIST-ADD}     //android.widget.Button[@content-desc="Close"]
${SETTING-BUTTON}           //android.widget.ImageButton[@content-desc="Settings"]

${SETTING-TITLE}            //android.widget.TextView[@resource-id="com.spotify.music:id/glue_toolbar_title"]
${ICON-VIEW-PROFILE}        //android.widget.ImageView[@resource-id="android:id/icon"]

${PROFILE-USER-NAME}        //android.widget.TextView[@resource-id="com.spotify.music:id/profile_title"]
${NAME-PROFILE-PLAYLIST}    //android.widget.TextView[@resource-id="com.spotify.music:id/title_view"]

${NME-PLYLIST}              //android.widget.TextView[@resource-id="com.spotify.music:id/title" and @text="DEMO-TEST"]
${MORE-OPTIONS-PLAYLIST}    //android.widget.ImageButton[@content-desc="More options for playlist DEMO-TEST"]
${DELETE-PLAYLIST}          //android.widget.TextView[@resource-id="com.spotify.music:id/title" and @text="Delete Playlist"]
${CONFIRM-DELETE-PLAYLIST}  //android.widget.TextView[@resource-id="com.spotify.music:id/title" and @text="Delete Playlist"]


@{elist}
${size}
${count}
${rowList}

*** Keywords ***

Open Spotify music app
    Open Application    http://localhost:4723   platformName=Android    deviceName=emulator-5554    appPackage=com.spotify.music    appActivity=com.spotify.music.SpotifyMainActivity    automationName=UiAutomator2

User log in with email id and password
    Wait Until Page Contains Element     ${LOGIN-BUTTON}     timeout=200
    Click Element                        ${LOGIN-BUTTON}
    Wait Until Page Contains Element     ${ENTER-USERNAME}
    Input Text                           ${ENTER-USERNAME}       ${USER-DETAILS}[email]
    Input Text                           ${ENTER-PASSWORD}       ${USER-DETAILS}[password]
    Click Element                        ${Login}

User lands on home page
    Wait Until Page Contains Element     ${ICON-HOME}     timeout=200
    Wait Until Element Is Visible        ${ICON-HOME}
    Wait Until Element Is Visible        ${ICON-SEARCH}
    Wait Until Element Is Visible        ${ICON-YOUR}
    Wait Until Element Is Visible        ${ICON-PREMIUM}



By default user should land on Home tab
    Element Should Be Enabled        ${ICON-HOME}

User clicks on the Home tab   
    Element Should Be Enabled        ${ICON-HOME} 
    Click Element    ${ICON-HOME} 

If user click on Search icon he should land on search tab
    [Arguments]         ${Search-Head}
    Click Element                        ${ICON-SEARCH}
    Wait Until Page Contains Element     ${HEADER-SEARCH}       timeout=200
    Element Should Contain Text          ${HEADER-SEARCH}       ${Search-Head}

If user click on Your Library he should land on your library page
    [Arguments]         ${library-Head}
    Click Element                        ${ICON-YOUR}
    Wait Until Page Contains Element     ${HEADER-YOUR-LIBRARY}     timeout=200
    Element Should Contain Text          ${HEADER-YOUR-LIBRARY}    	${library-Head}

If user click on Premium he should land on premium tab
    Click Element                    ${ICON-PREMIUM}
#    Wait Until Page Contains Element     ${HEADER-PREMIUM}     timeout=200
#    Element Name Should Be           ${HEADER-PREMIUM}    Premium

User enter the text and click on search
    [Arguments]      ${INPUT-TEXT}
    Click Element    ${SEARCH-TEXT-BOX}
    Input Text       ${ENTER-SEARCH-TEXT}      ${INPUT-TEXT}

Search result contains list of playlist
    [Arguments]     ${TEXT-CONTAILS}
    Wait Until Page Contains Element     ${songsName}     timeout=200
    ${count}=       Get Matching Xpath count  ${songsName}
#    ${rowList}=     Create List
        FOR    ${i}    IN RANGE   ${count}
        Element Should Contain Text    xpath=(//android.widget.GridView[@resource-id="com.spotify.music:id/search_body"]//android.widget.TextView[@resource-id="com.spotify.music:id/title"])[${i}+1]    ${TEXT-CONTAILS}

#        ${text}=    Get Element Attribute    xpath=(//android.widget.GridView[@resource-id="com.spotify.music:id/search_body"]//android.widget.TextView[@resource-id="com.spotify.music:id/title"])[${i}+1]    text
#        Log To Console    ${text}
#        Append To List    ${rowList}  ${text}
    END

Click on Back button on List of playlist page
    Click Element    ${SEARCH-BACK-BUTTON}

Create_New_Playlist
    [Arguments]     ${PLAYLIST-NAME}
    Click Element                        ${ICON-YOUR}
    Wait Until Page Contains Element     ${HEADER-YOUR-LIBRARY}     timeout=200
    Click Element                        ${CREATE-PLAYLIST-ICON}
    Click Element                        ${CREATE-PLAYLIST}
    Clear Text                           ${NAME-CREATE-PLAYLIST}
    Input Text                           ${NAME-CREATE-PLAYLIST}     ${PLAYLIST-NAME}
    Click Element                        ${BUTTON-CREATE-PLAYLIST}
    Wait Until Page Contains Element     ${NAME-NEW-PLAYLIST}
    Element Should Contain Text          ${NAME-NEW-PLAYLIST}    ${PLAYLIST-NAME}

Add_Songs_To_Playlist
    Wait Until Page Contains Element    ${ADD-TO-PLAYLIST}

    Wait Until Page Contains Element    ${PLAYLIST-ITEM-ONE}
    Click Element                       ${PLAYLIST-ITEM-ONE}

    Wait Until Page Contains Element    ${PLAYLIST-ITEM-TWO}
    Click Element                       ${PLAYLIST-ITEM-TWO}
    Wait Until Page Contains Element    ${PLAYLIST-ITEM-THREE}
    Click Element                       ${PLAYLIST-ITEM-THREE}
    Click Element                       ${BUTTON-BACK-PLAYLIST-ADD}

Playlist_Should_Display_In_User_Profile_Page
    Click Element                       ${ICON-HOME}
    Click Element                       ${SETTING-BUTTON}
    Wait Until Page Contains Element    ${SETTING-TITLE}
    Click Element                       ${ICON-VIEW-PROFILE}
    
New_Playlist_Created_Is_Displayed
    [Arguments]     ${PLAYLIST-NAME}
    Wait Until Page Contains Element    ${PROFILE-USER-NAME}
    Element Should Contain Text         ${NAME-PROFILE-PLAYLIST}    ${PLAYLIST-NAME}

Delete_PlayList_Library_Page
    Click Element                        ${ICON-YOUR}
    Wait Until Page Contains Element     ${HEADER-YOUR-LIBRARY}     timeout=200
    Click Element                        ${NME-PLYLIST}
    Wait Until Page Contains Element     ${MORE-OPTIONS-PLAYLIST}
    Click Element                        ${MORE-OPTIONS-PLAYLIST}
    Wait Until Page Contains Element     ${DELETE-PLAYLIST}
    Click Element                        ${DELETE-PLAYLIST}
    Click Element                        ${CONFIRM-DELETE-PLAYLIST}

Scroll_To
    Scroll Element Into View    locator
    Swipe    start_x    start_y    offset_x    offset_y

