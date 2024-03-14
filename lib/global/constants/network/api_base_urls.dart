class ApiBaseUrls {
  ApiBaseUrls._();

  static const String https = "https://";

  static const String http = "http://";

  // Facebook API Base URL 
  static const String facebook = "graph.facebook.com";

  // Google API Base URL
  static const String google = "www.googleapis.com";

  // Twitter API Base URL
  static const String twitter = "api.twitter.com";

  // Instagram API Base URL
  static const String instagram = "graph.instagram.com";

  // LinkedIn API Base URL
  static const String linkedIn = "api.linkedin.com";

  // YouTube API Base URL
  static const String youTube = "www.googleapis.com";

  /*// TikTok API Base URL
  static const String tikTok = "www.tiktok.com";

  // Pinterest API Base URL
  static const String pinterest = "api.pinterest.com";

  // Reddit API Base URL
  static const String reddit = "www.reddit.com";

  // Tumblr API Base URL
  static const String tumblr = "api.tumblr.com";

  // Flickr API Base URL
  static const String flickr = "api.flickr.com";

  // Snapchat API Base URL
  static const String snapchat = "kit.snapchat.com";

  // WhatsApp API Base URL
  static const String whatsApp = "api.whatsapp.com";

  // Skype API Base URL
  static const String skype = "api.skype.com";

  // Telegram API Base URL
  static const String telegram = "api.telegram.org";

  // Signal API Base URL
  static const String signal = "signal.org";

  // Viber API Base URL
  static const String viber = "developers.viber.com";

  // WeChat API Base URL
  static const String weChat = "open.wechat.com";

  // Line API Base URL
  static const String line = "developers.line.biz";

  // Kik API Base URL
  static const String kik = "dev.kik.com";

  // Discord API Base URL
  static const String discord = "discord.com";

  // Slack API Base URL
  static const String slack = "api.slack.com";

  // Zoom API Base URL
  static const String zoom = "api.zoom.us";

  // Webex API Base URL
  static const String webex = "developer.webex.com";

  // Microsoft Teams API Base URL
  static const String microsoftTeams = "docs.microsoft.com";

  // Google Meet API Base URL
  static const String googleMeet = "developers.google.com";

  // GoToMeeting API Base URL
  static const String goToMeeting = "goto-developer.logmeininc.com";

  // Jitsi API Base URL
  static const String jitsi = "jitsi.github.io";

  // BigBlueButton API Base URL
  static const String bigBlueButton = "docs.bigbluebutton.org";

  // Apache OpenMeetings API Base URL
  static const String apacheOpenMeetings = "openmeetings.apache.org";*/

  // OpenAI API API Base URL for DALL-E & CLIP & GPT-3
  static const String openAI = "api.openai.com";

  // Replicate API Base URL
  static const String replicate = "api.replicate.com";

  // KeyEKMAN API Key
  static const String EKMAN = "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";

  // Webflow API Base URL
  static String webflow = "api.webflow.com";

  // Webflow API Base URL
  //static const String webflowCollections = "api.webflow.com/collections";

  //https://api.webflow.com/collections/642d828a7e0ce90b843e4238/items?live=true
  static String webflowItemsCollectionLive(String collection) => "collections/$collection/items?live=true";

  // Webflow API Base URL
  //https://api.webflow.com/sites/642d82897e0ce9648d3e4195
  static const String webflowSites = "sites";

  //https://api.webflow.com/sites/642d82897e0ce9648d3e4195
  static String webflowSite(String siteId) => "sites/$siteId";

  /*// Webflow API Base URL
  static const String webflowItems = "api.webflow.com/items";

  // Webflow API Base URL
  static const String webflowItemsLive = "api.webflow.com/items?live=true";

  // Webflow API Base URL
  static const String webflowItemsDraft = "api.webflow.com/items?live=false";

  // Webflow API Base URL
  static const String webflowItemsPublished = "api.webflow.com/items?published=true";

  // Webflow API Base URL
  static const String webflowItemsUnpublished = "api.webflow.com/items?published=false";

  // Webflow API Base URL
  static const String webflowItemsCollection = "api.webflow.com/items?collection=";

  // Webflow API Base URL
  static const String webflowItemsCollectionLive = "api.webflow.com/items?collection=&live=true";

  // Webflow API Base URL
  static const String webflowItemsCollectionDraft = "api.webflow.com/items?collection=&live=false";

  // Webflow API Base URL
  static const String webflowItemsCollectionPublished = "api.webflow.com/items?collection=&published=true";

  // Webflow API Base URL
  static const String webflowItemsCollectionUnpublished = "api.webflow.com/items?collection=&published=false";*/

  ////////////////////////////////////////////////////////////////

  ///https://api.openai.com/v1/completions
  static const String gpt3 = "v1/completions";

  //https://api.replicate.com/v1/predictions
  static const String stableDiffusion = "v1/predictions";


  }