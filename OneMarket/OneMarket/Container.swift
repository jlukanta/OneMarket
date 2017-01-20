import Swinject
import SwinjectStoryboard

// Dependency-injection container setup
extension SwinjectStoryboard {
  class func setup() {
    
    // Service resolutions
    defaultContainer.register(ItemService.self) { _ in DefaultsItemService() }
    
    defaultContainer.storyboardInitCompleted(ItemListVC.self) { r, vc in
      vc.itemService = r.resolve(ItemService.self)
    }
    
    defaultContainer.storyboardInitCompleted(ItemAddVC.self) { r, vc in
      vc.itemService = r.resolve(ItemService.self)
    }
    
    defaultContainer.storyboardInitCompleted(ItemEditVC.self) { r, vc in
      vc.itemService = r.resolve(ItemService.self)
    }
    
    defaultContainer.storyboardInitCompleted(ItemDetailsVC.self) { r, vc in
      vc.itemService = r.resolve(ItemService.self)
    }
  }
}
