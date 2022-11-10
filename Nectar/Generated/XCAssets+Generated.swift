// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let about = ImageAsset(name: "about")
    internal static let address = ImageAsset(name: "address")
    internal static let avatar = ImageAsset(name: "avatar")
    internal static let bell = ImageAsset(name: "bell")
    internal static let details = ImageAsset(name: "details")
    internal static let editPencil = ImageAsset(name: "edit-pencil")
    internal static let help = ImageAsset(name: "help")
    internal static let logOut = ImageAsset(name: "log-out")
    internal static let orders = ImageAsset(name: "orders")
    internal static let payment = ImageAsset(name: "payment")
    internal static let promoCode = ImageAsset(name: "promo-code")
    internal static let eggBrown = ImageAsset(name: "egg-brown")
    internal static let eggNoodlePurple = ImageAsset(name: "egg-noodle-purple")
    internal static let eggNoodleRed = ImageAsset(name: "egg-noodle-red")
    internal static let eggPasta = ImageAsset(name: "egg-pasta")
    internal static let eggWhite = ImageAsset(name: "egg-white")
    internal static let mayonnaise = ImageAsset(name: "mayonnaise")
    internal static let account = ImageAsset(name: "account")
    internal static let addToCartCheckmark = ImageAsset(name: "add-to-cart-checkmark")
    internal static let addToCart = ImageAsset(name: "add-to-cart")
    internal static let apple = ImageAsset(name: "apple")
    internal static let backButton = ImageAsset(name: "back-button")
    internal static let bakery = ImageAsset(name: "bakery")
    internal static let banana = ImageAsset(name: "banana")
    internal static let bellPepper = ImageAsset(name: "bell-pepper")
    internal static let beverages = ImageAsset(name: "beverages")
    internal static let bottomMask = ImageAsset(name: "bottom-mask")
    internal static let card = ImageAsset(name: "card")
    internal static let carrotLogo = ImageAsset(name: "carrot-logo")
    internal static let cart = ImageAsset(name: "cart")
    internal static let checkboxNotSelected = ImageAsset(name: "checkbox-not-selected")
    internal static let checkboxSelected = ImageAsset(name: "checkbox-selected")
    internal static let checkmark = ImageAsset(name: "checkmark")
    internal static let chevronDown = ImageAsset(name: "chevron-down")
    internal static let chevronUp = ImageAsset(name: "chevron-up")
    internal static let chicken = ImageAsset(name: "chicken")
    internal static let colaDiet = ImageAsset(name: "cola-diet")
    internal static let cola = ImageAsset(name: "cola")
    internal static let countryFlag = ImageAsset(name: "country-flag")
    internal static let cross = ImageAsset(name: "cross")
    internal static let dairy = ImageAsset(name: "dairy")
    internal static let explore = ImageAsset(name: "explore")
    internal static let eyeFill = ImageAsset(name: "eye.fill")
    internal static let eyeSlashFill = ImageAsset(name: "eye.slash.fill")
    internal static let facebookIcon = ImageAsset(name: "facebook-icon")
    internal static let favourite = ImageAsset(name: "favourite")
    internal static let filter = ImageAsset(name: "filter")
    internal static let fruitsVegetables = ImageAsset(name: "fruits-vegetables")
    internal static let ginger = ImageAsset(name: "ginger")
    internal static let goToCart = ImageAsset(name: "go-to-cart")
    internal static let googleIcon = ImageAsset(name: "google-icon")
    internal static let isFavourite = ImageAsset(name: "is-favourite")
    internal static let juiceGrape = ImageAsset(name: "juice-grape")
    internal static let juiceOrange = ImageAsset(name: "juice-orange")
    internal static let launchScreenColor = ColorAsset(name: "launch-screen-color")
    internal static let launchScreenLogo = ImageAsset(name: "launch-screen-logo")
    internal static let loading = ImageAsset(name: "loading")
    internal static let locationPoint = ImageAsset(name: "location-point")
    internal static let location = ImageAsset(name: "location")
    internal static let logoColoredCarrot = ImageAsset(name: "logo-colored-carrot")
    internal static let meatFish = ImageAsset(name: "meat-fish")
    internal static let meat = ImageAsset(name: "meat")
    internal static let minus = ImageAsset(name: "minus")
    internal static let nextButton = ImageAsset(name: "next-button")
    internal static let notFavourite = ImageAsset(name: "not-favourite")
    internal static let oil = ImageAsset(name: "oil")
    internal static let orderAccepted = ImageAsset(name: "order-accepted")
    internal static let orderFailed = ImageAsset(name: "order-failed")
    internal static let pepsi = ImageAsset(name: "pepsi")
    internal static let plus = ImageAsset(name: "plus")
    internal static let pulse = ImageAsset(name: "pulse")
    internal static let rice = ImageAsset(name: "rice")
    internal static let rightArrow = ImageAsset(name: "right-arrow")
    internal static let searchCancel = ImageAsset(name: "search-cancel")
    internal static let searchMagnifier = ImageAsset(name: "search-magnifier")
    internal static let share = ImageAsset(name: "share")
    internal static let shop = ImageAsset(name: "shop")
    internal static let signInHeader = ImageAsset(name: "sign-in-header")
    internal static let sprite = ImageAsset(name: "sprite")
    internal static let star = ImageAsset(name: "star")
    internal static let topMask = ImageAsset(name: "top-mask")
    internal static let underline = ImageAsset(name: "underline")
    internal static let welcomeScreenBackground = ImageAsset(name: "welcome-screen-background")
  }
  internal enum Colors {
    internal static let buttonTitle = ColorAsset(name: "button-title")
    internal static let darkGray = ColorAsset(name: "dark-gray")
    internal static let darkGreen = ColorAsset(name: "dark-green")
    internal static let facebookButtonColor = ColorAsset(name: "facebook-button-color")
    internal static let googleButtonColor = ColorAsset(name: "google-button-color")
    internal static let green = ColorAsset(name: "green")
    internal static let homeCategoryBannerTitleGray = ColorAsset(name: "home-category-banner-title-gray")
    internal static let lightGray = ColorAsset(name: "light-gray")
    internal static let locationGray = ColorAsset(name: "location-gray")
    internal static let minusBorderGray = ColorAsset(name: "minus-border-gray")
    internal static let nutritionLightGray = ColorAsset(name: "nutrition-light-gray")
    internal static let plusBorderGray = ColorAsset(name: "plus-border-gray")
    internal static let productCellBorderGray = ColorAsset(name: "product-cell-border-gray")
    internal static let questionBlack = ColorAsset(name: "question-black")
    internal static let searchGray = ColorAsset(name: "search-gray")
    internal static let searchLightGray = ColorAsset(name: "search-light-gray")
    internal static let subtitleGray = ColorAsset(name: "subtitle-gray")
    internal static let tabBarShadow = ColorAsset(name: "tabBar-shadow")
    internal static let titleBlack = ColorAsset(name: "title-black")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
