#!/bin/bash

#
#https://developer.apple.com/library/archive/qa/qa1827/_index.html

read -p  "enter app scheme : `echo $'\n> '`" appScheme

##subsequen commented lines below are going to be useful for batch updates version of the script at the moment this script just bumps version automatically.

# read -p  "is this a new release or a batch release ? enter Y for the former and N for the latter" isNewRelease



# #for batch
# currentVersion=0.0;
# function getVersion() {
#   $currentVersion = agvtool mvers -terse1
#   echo $currentVersion
# }
 
#  if $isNewRelease == 'Y' {
#     $currentVersion = $currentVersion+1.0 
#  }
#  echo $currentVersion
 #for new release
# echo Input new version number format x.y! or retain old version of same format!
# read versionNumber

read -p "Input new version number format x.y! or retain old version of same format! : `echo $'\n> '`" versionNumber
echo updating version number..
agvtool new-marketing-version $versionNumber > cottylane.txt #Updates Version Number to specific version format is versionnumber(buildnumber)
echo Resetting build number to 1 for new release..
agvtool new-version -all 1 >>/dev/null
# agvtool next-version -all >>/dev/null increment build number to next highest integer. should be for updates.
fullversion="$(agvtool mvers -terse1)($(agvtool vers -terse))"


function build() {
    xcodebuild -scheme $appScheme -configuration Staging -workspace $appScheme.xcworkspace/ build  >> cottylane.txt
}

function archive() {
	xcodebuild -scheme $appScheme -configuration Staging -workspace $appScheme.xcworkspace/ archive -archivePath $PWD/build/$appScheme.xcarchive >> cottylane.txt #archive
}

function exportIPA() {
	xcodebuild -exportArchive -archivePath $PWD/build/$appScheme.xcarchive -exportOptionsPlist OptionsPlist.plist -exportPath $PWD/build  >> cottylane.txt 
}

function upload() {
   echo cleaning UploadTokens..
   rm -rf /Library/Caches/com.apple.amp.itmstransporter/UploadTokens/*

   /Applications/Xcode.app/Contents/Applications/Application\ Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Support/altool --upload-app -f $PWD/build/$appScheme.ipa -u developers@cottacush.com -p $OTP > cottylane.txt

}

echo building version $fullversion ..

 if build; then echo build completed .
 else echo Build failed..
 fi

echo archiving version $fullversion ..

 if archive; then echo archive completed .
 else echo archive failed..
 fi

echo exporting  IPA of  version $fullversion ..

 if exportIPA; then echo  completed exporting IPA .
 else echo export of IPA failed..
 fi

echo One Time Password is needed #generate OTP from appleid.apple.com
read OTP

	if  upload; then  echo IPA file has been uploaded to TestFlight
    # elif rm -rf $PWD/build/FBNInsurance.ipa; then upload ; echo Uploaded.
    else echo OOps an error occured, rerun script.
    fi







