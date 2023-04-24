


#import <Foundation/Foundation.h>
#import "RTNMyPicker.h"


@implementation RTNMyPicker
RCT_EXPORT_MODULE()

//MyCamera *myCamera = [[MyCamera alloc] init];
NSString *localId;

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
(const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeMyPickerSpecJSI>(params);
}

//- (void)takePhoto {
//  //    [myCamera takePhotoFromCamera];
//  dispatch_async(dispatch_get_main_queue(), ^{
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//
//    UIViewController *root = RCTPresentedViewController();
//    [root presentViewController:picker animated:YES completion:nil];
//
//    //    [self presentViewController:picker animated:YES completion:nil];
//  });
//}

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
//  [picker dismissViewControllerAnimated:YES completion:NULL];
//  UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
//
//  TOCropViewController *cropViewController = [[TOCropViewController alloc] initWithImage:image];
//  cropViewController.delegate = self;
//
//  UIViewController *root = RCTPresentedViewController();
//  [root presentViewController:cropViewController animated:YES completion:nil];
//
//}

//- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle{
//
//
//  [cropViewController dismissViewControllerAnimated:YES completion:nil];
//  PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
//
//   if (status == PHAuthorizationStatusAuthorized) {
//     [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
//       localId = [PHAssetChangeRequest creationRequestForAssetFromImage:image].placeholderForCreatedAsset.localIdentifier;
//     } completionHandler:^(BOOL success, NSError * _Nullable error) {
//       [EventEmitter.shared sendEventWithName:@"onMyEvent" body:localId];
//       NSLog(@"%@", localId);
//     }];
//   } else {
//     [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
//       if (status == PHAuthorizationStatusAuthorized) {
//
//         [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
//           localId = [PHAssetChangeRequest creationRequestForAssetFromImage:image].placeholderForCreatedAsset.localIdentifier;
//         } completionHandler:^(BOOL success, NSError * _Nullable error) {
//           [EventEmitter.shared sendEventWithName:@"onMyEvent" body:localId];
//           NSLog(@"%@", localId);
//         }];
//
//
//       }
//       else {
//
//       }
//     }];
//   }
//}

- (void)pickImage {
  dispatch_async(dispatch_get_main_queue(), ^{
//  PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
//  if (status == PHAuthorizationStatusAuthorized) {
//
//  } else {
//    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
//      if (status == PHAuthorizationStatusAuthorized) {

        PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
        PHPickerConfiguration *config = [[PHPickerConfiguration alloc] initWithPhotoLibrary: photoLibrary];
        config.selectionLimit = 1;
        config.filter = [PHPickerFilter imagesFilter];
        PHPickerViewController *pickerViewController = [[PHPickerViewController alloc] initWithConfiguration:config];
        pickerViewController.delegate = self;
        UIViewController *root = RCTPresentedViewController();
        [root presentViewController:pickerViewController animated:YES completion:nil];


//      }
//      else {
//        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
//              if (status == PHAuthorizationStatusAuthorized) {
//
//                PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
//                PHPickerConfiguration *config = [[PHPickerConfiguration alloc] initWithPhotoLibrary: photoLibrary];
//                config.selectionLimit = 1;
//                config.filter = [PHPickerFilter imagesFilter];
//                PHPickerViewController *pickerViewController = [[PHPickerViewController alloc] initWithConfiguration:config];
//                pickerViewController.delegate = self;
//                UIViewController *root = RCTPresentedViewController();
//                [root presentViewController:pickerViewController animated:YES completion:nil];
//
//
//              }
//              else {
//
//              }
//            }];
//      }
//    }];
//  }
  
   
  
  
  

    
    
    
    
  });
  
}

- (void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results{
  [picker dismissViewControllerAnimated:YES completion:NULL];
  //  NSLog(@"Swift identifier is %@", results[0].assetIdentifier);
  [EventEmitter.shared sendEventWithName:@"onMyEvent" body:results[0].assetIdentifier];
  
  //  [picker dismissViewControllerAnimated:YES completion:nil];
  //      for (PHPickerResult *result in results) {
  //          NSArray *assetIdentifiers = @[result.assetIdentifier];
  //          PHFetchResult *assetResults = [PHAsset fetchAssetsWithLocalIdentifiers:assetIdentifiers options:nil];
  // Do something with the assetResults if you have Photos Library access
  //      }
}

@end
