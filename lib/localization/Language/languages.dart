import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;
  String get labelWelcome;
  String get labelInfo;
  String get labelChangeLanguage;
  String get labelSelectLanguage;

  //onborard screen
  String get onboardtitle;
  String get onboardsubtitle;
  String get onboardstarts;
  String get welcomemessage;
  String get welcomebtnname;
  String get welcomemessagefirst;
  String get welcomemessagese;
  String get welcomemessagethree;

  //dashboard part
  String get home;
  String get categories;
  String get bidding;
  String get profile;
  String get categoriesonly;
  String get category;
  String get pleaseselcectcategory;
  String get pleaseselcectsubcategory;
  String get pleaseselcectbrand;
  String get brand;
  String get subcategories;
  String get viewallcategories;
  String get currentruningbids;
  String get myproductlist;

// social login
  String get loginwithgoogle;
  String get loginwithfb;
  String get loginwithapple;
  String get orloginwith;
  String get donthaveaccount;
  String get otpnotrecive;
  String get resend;
  String get skip;
  String get done;
  String get alreadyregister;
  String get iacceptthe;
  String get termsandcondition;
  String get firstname;
  String get lastname;
  String get next;
  String get sellers;
  String get customers;
  String get role;
  String get rolemessage;
  String get alter;
  String get pleaseaccettermesandcondtions;
  String get confirmpasswordandpasswordnotmatch;
  String get price;
  String get bid;
  String get selectoption;
  String get soldBy;
  String get unit;
  String get mrp;
  String get productdetails;
  String get description;
  String get buy;
  String get productname;
  String get address;
  String get pincode;
  String get orderagain;
  String get bestsellingproducts;
  String get quantity;
  String get allreview;
  String get relatedproducts;
  String get sort;
  String get filter;

  //settings
  String get contactus;
  String get feedback;
  String get privacypolicy;
  String get cookiespolicy;
  String get accountsettings;
  String get helpnsupport;
  String get aboutmanaqa;
  String get rateapp;
  String get shareapp;
  String get changelanguage;
  String get shippingpolicy;
  String get cancelationpolicy;
  String get nointernetconnection;
  String get update;
  String get editprofile;
  String get deleteaccount;
  String get logoutmanaqamsg;
  String get deleteaccountmsg;
  // app translation
  String get cart;
  String get myorder;
  String get wishlist;
  String get settings;
  String get nodatafound;
  String get search;
  String get biddingform;
  String get searchyourorder;

// bidding form
  String get cancel;
  String get startbidding;
  String get enterdescription;
  String get biddingprice;
  String get productquantity;
  String get productsname;
  String get productsubcategory;
  String get productcategory;
  String get addtocart;
  String get checkout;
  String get notifications;
  String get upLoadImg;
  String get front;
  String get back;
  String get side;
  String get upload;
  String get Plank;
  String get Mealtime;
  //others

  String get remove;
  String get productadd;
  String get title;
  String get report;

// COACHBYAPP
  // body parts
  String get biceps;
  String get bum;
  String get waist;
  String get leg;
  // edit profile
  String get weight;
  String get height;
  String get gender;
  String get age;
  String get steps;

// authentication part
  String get welcomelogintitlemsg;
  String get welcomeloginsubtitlemsg;
  String get name;
  String get email;
  String get password;
  String get mobile;
  String get pleaseenteremail;
  String get pleaseentervalidemail;
  String get pleaseenterpassword;
  String get pleaseentervalidpassword;
  String get login;
  String get logout;
  String get loginsussces;
  String get signup;
  String get forgotpassword;
  String get sendrequest;
  String get passwordrequest;
  String get passwordrequestmsg;
  String get otpverify;
  String get verify;
  String get submit;
  String get changenewpassword;
  String get changepassword;
  String get rememberyourpassword;
  String get plzenterotpverify;
  String get forgotpasswordmsg;
  String get currentpassword;
  String get confirmpassword;
  String get confirmnewpassword;
  String get newpassword;
  String get forgotpasswords;
  String get verifyaccount;
  String get verifyaccountmsg;

// drawer section
  String get dashboard;
  String get plans;
  String get training;
  String get myaccount;
  String get myfavorites;
  String get appsettings;
  String get contactsupport;
  String get previous_support;
  String get exercise;
  String get mealplan;
  // fitness selection steps counter
  String get nextsteps;
  String get selectyourfavorite;
  String get logoutmsg;
  String get no;
  String get yes;
  String get darkmode;
  String get lightmode;
  // notification:
  String get delete;
  String get alert;
  String get deletealertnmsg;
  String get continues;
  String get start;
  String get notificationNotAvailable;
  // others
  String get good;
  String get morning;
  String get afternoon;
  String get evening;
  String get night;
  String get internetnotavailable;
  String get ok;
  String get otpsendsuccessfully;
  String get usernewpasswordupdated;
  String get confirmpasswordmustbematch;
  String get changepasswords;
  String get aboutus;
  String get wanttoexitapp;
  String get chat;
  String get gallary;
  String get package;
  String get getPlan;
  String get Offers;
  String get trainerName;
  String get online;

  String get weekly;

  String get weeklyProgress;

  String get weeklyPrevious;
  //27/sep
  String get Nextweeke;
  String get trainingVedio;
  String get Trainingschedules;
  String get totalExcercise;

  String get getdown;

  String get getdownmessage;

  String get getup;
  String get savedMessage;
  String get cutomerInformation;

  //contactus
  String get contactusSubtitle;

  //personal details
  String get personalDetails;
  String get startingWeight;
  String get length;
  String get trainingPlace;
  String get trainingDaysPerWeek;

  String get tagetWeight;
  String get entertargetWeight;
  String get pleaseEnterTargetWeight;
  String get heightInCm;
  String get enterHeight;
  String get enterYourHeight;
  String get pleaseEnterHeight;
  String get experience;
  String get enterExperience;
  String get pleaseEnterExperience;
  String get availabilityInWeek;
  String get enterDays;
  String get pleaseEnterDays;
  String get gymName;
  String get enterGymName;
  String get pleaseEnterGymName;
  String get enterYourdescription;
  String get pleaseEnterYourDescription;
  String get currentWeight;
  String get enterYourCurrentWeight;
  String get pleaseEnterYourCurrentWeight;
  String get male;
  String get female;
  String get others;
  String get dob;
  String get enterYourDob;
  String get pleaseEnterYourDob;
  String get startDate;
  String get enterStartDate;
  String get pleaseEnterStartDate;
  String get checkInDays;
  String get enterCheckInDays;
  String get pleaseEnterCheckInDays;
  String get tags;
  String get enterTags;
  String get pleaseEnterTags;
  String get socialSecurityNumber;
  String get enterSocialSecurityNumber;
  String get pleaseEnterSocialSecurityNumber;
  String get activity;
  String get enterActivity;
  String get pleaseEnterActivity;
  String get disease;
  String get enterdisease;
  String get pleaseEnterDisease;
  String get allergies;
  String get enterAllergies;
  String get pleaseEnterAllergies;
  String get mealsPerDay;
  String get pleaseEnterMealsPerDay;
  String get measure;
  String get enterYourMeasure;
  String get pleaseEnterYourMeasure;

  String get sendMessage;
  String get message;
  String get leaveUsMessage;

  //diet plan
  String get recommendedmeal;
  String get alternativemeal;
  String get protien;
  String get fat;
  String get calorie;
  String get carbohydrate;
  String get dietPlan;

// App Validation

  String get pleaseEnterEmailAddress;
  String get pleaseEnterValidEmailAddress;
  String get pleaseEnterYourPassword;
  String get pleaseEnterConfirmPassword;
  String get passwordMustBeTheSame;
  String get pleaseEnterYourName;
  String get nameIsTooShort;
  String get mobileNumberIsRequired;
  String get enterCurrentPassword;
  String get releatedRecipe;
  String get optionalIngredients;
  String get prepareTime;
  String get servings;
  String get calories;
  String get cookingStep;
  String get step;
  String get ingredients;
  String get messageSentSuccessfully;
  String get messageShouldNotBeEmpty;
  String get fitnessOnlineTrainingCoach;
  String get favoriteSearch;
  String get details1;
  String get today;
  String get yesterday;
  String get tomarrow;
  String get save;
  String get somethingWentWrong;
  String get imageNotSelected;
  String get uploadImage;
  String get uploadFrontImage;
  String get uploadBackImage;
  String get uploadSideImage;
  String get informationAddedSuccessfully;
  String get passwordUpdated;
  String get currentPasswordIncorrect;
  String get currentandNewPasswordNotSame;
  String get optVarificationFailure;
  String get fillThisfield;
  String get sevenDaysdietPlan;
  String get breakfast;
  String get lunch;
  String get snack;
  String get day;
  String get justNow;
  String get welcomeDesc1;
  String get welcomeDesc2;
  String get welcomeDesc3;
  String get searchCardDesc;
  String get writeComment;
  String get updateNow;
  String get drops;
  String get reps;
  String get comment;
  String get month;
  String get popularPlan;
  String get week;
  String get option;
  String get optionalIn;
  String get current;
  String get Good;

  String get Okay;

  String get Lessgood;

  String get changes;

  String get follow;
  String get previousweekQuestion;
  String get upcommingFirst;
  @override
  String get upcommingFirstan;
  String get upcommingsecond;
  @override
  String get whatdays;
  @override
  String get monday;
  @override
  String get tuesday;
  @override
  String get wednesday;
  @override
  String get thursday;
  @override
  String get friday;
  @override
  String get saturday;
  @override
  String get sunday;
  String get prevoiusweekchalange;
   String get success ;
    String get writemessage;
     String get answerconatc;
      String get energydesc;
     String get  ingradients;
}
