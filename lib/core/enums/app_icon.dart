enum AppIcon {
  apis,
  cloud,
  code,
  database,
  design,
  dev,
  framework,
  git,
  injection,
  layer,
  location,
  mobile,
  notification,
  share,
  state,
  store,
  web,
}

extension AppIconExtension on AppIcon {
  String get path {
    switch (this) {
      case AppIcon.apis:
        return 'assets/svgs/apis_icon.svg';
      case AppIcon.cloud:
        return 'assets/svgs/cloud_icon.svg';
      case AppIcon.code:
        return 'assets/svgs/code_icon.svg';
      case AppIcon.database:
        return 'assets/svgs/database_icon.svg';
      case AppIcon.design:
        return 'assets/svgs/design_icon.svg';
      case AppIcon.dev:
        return 'assets/svgs/dev_icon.svg';
      case AppIcon.framework:
        return 'assets/svgs/framework_icon.svg';
      case AppIcon.git:
        return 'assets/svgs/git_icon.svg';
      case AppIcon.injection:
        return 'assets/svgs/injection_icon.svg';
      case AppIcon.layer:
        return 'assets/svgs/layer_icon.svg';
      case AppIcon.location:
        return 'assets/svgs/location_icon.svg';
      case AppIcon.mobile:
        return 'assets/svgs/mobile_icon.svg';
      case AppIcon.notification:
        return 'assets/svgs/notification_icon.svg';
      case AppIcon.share:
        return 'assets/svgs/share_icon.svg';
      case AppIcon.state:
        return 'assets/svgs/state_icon.svg';
      case AppIcon.store:
        return 'assets/svgs/store_icon.svg';
      case AppIcon.web:
        return 'assets/svgs/web_icon.svg';
    }
  }

  static AppIcon? fromString(String value) {
    switch (value.toLowerCase()) {
      case 'apis':
        return AppIcon.apis;
      case 'cloud':
        return AppIcon.cloud;
      case 'code':
        return AppIcon.code;
      case 'database':
        return AppIcon.database;
      case 'design':
        return AppIcon.design;
      case 'dev':
        return AppIcon.dev;
      case 'framework':
        return AppIcon.framework;
      case 'git':
        return AppIcon.git;
      case 'injection':
        return AppIcon.injection;
      case 'layer':
        return AppIcon.layer;
      case 'location':
        return AppIcon.location;
      case 'mobile':
        return AppIcon.mobile;
      case 'notification':
        return AppIcon.notification;
      case 'share':
        return AppIcon.share;
      case 'state':
        return AppIcon.state;
      case 'store':
        return AppIcon.store;
      case 'web':
        return AppIcon.web;
      default:
        return null;
    }
  }
}
