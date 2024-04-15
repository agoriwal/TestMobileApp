*** Settings ***
Library     AppiumLibrary

*** Variables ***

${ICON-USER-PROFILE}   	                //android.widget.ImageView[@resource-id="com.spotify.music:id/faceheader_image"]
${USER-NAME}                            //android.widget.TextView[@resource-id="com.spotify.music:id/profile_row_sidedrawer_title"]
${VIEW-PROFILE-BUTTON}                  //android.widget.TextView[@resource-id="com.spotify.music:id/profile_row_sidedrawer_subtitle"]
${WHATS-NEW}                            //android.widget.TextView[@resource-id="com.spotify.music:id/link_row_sidedrawer_title" and @text="What's new"]
${LISTENING-HISTORY}                    //android.widget.TextView[@resource-id="com.spotify.music:id/link_row_sidedrawer_title" and @text="Listening history"]
${SETTINGS-AND-PRIVACY}                 //android.widget.TextView[@resource-id="com.spotify.music:id/link_row_sidedrawer_title" and @text="Settings and privacy"]

${USERNAME-PROFILE-SUMMARY-PAGE}        //android.widget.TextView[@resource-id="com.spotify.music:id/profile_title"]
${USER-LOGO}                            //android.widget.ImageView[@content-desc="Profile picture"]
${USERNAME-PROFILE-EDIT-BUTTON}         //android.widget.Button[@resource-id="com.spotify.music:id/edit_button"]

${BUTTON-BESIDE-PROFILE-EDIT-BUTTON}    //android.widget.ImageButton[@content-desc="Show context menu"]
${BOTTOM-POPUP}                         //android.widget.FrameLayout[@resource-id="com.spotify.music:id/design_bottom_sheet"]

${BUTTON-CLOSE}
${BACK-BUTTON}

${thislist}


*** Keywords ***

User clicks on the User Profile icon
    Click Element    ${ICON-USER-PROFILE}

Lands on View Profile page
    Element Name Should Be    ${USER-NAME}                      expected
    Element Name Should Be    ${VIEW-PROFILE-BUTTON}            expected
    Element Name Should Be    ${WHATS-NEW}                      expected
    Element Name Should Be    ${LISTENING-HISTORY}              expected
    Element Name Should Be    ${SETTINGS-AND-PRIVACY}           expected

After clicking on View Profile button user lands on user profile details page
    Click Element             ${VIEW-PROFILE-BUTTON}
    Element Name Should Be    ${USERNAME-PROFILE-SUMMARY-PAGE}  expected
    Element Should Be Visible ${USER-LOGO}
    Element Should Be Visible ${USERNAME-PROFILE-EDIT-BUTTON}

User clicks on the three dots icon beside edit button
    Click Element              ${BUTTON-BESIDE-PROFILE-EDIT-BUTTON}

Receives a side up screen from the bottom
    Element Should Be Visible  ${BOTTOM-POPUP}

Clicking on Edit button lands on Edit Profile page
    Click Element               ${USERNAME-PROFILE-EDIT-BUTTON}

After clicking on close button lands on user profile details page
    Click Element               ${BUTTON-CLOSE}
    Element Name Should Be      ${USERNAME-PROFILE-SUMMARY-PAGE}    expected

Clicking back button on user profile details takes to Home page
    Click Element               ${BACK-BUTTON}
    ${thislist}=    Get Webelements    locator

