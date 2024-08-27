//
//  CameraViewModel.swift
//  Mandle
//
//  Created by 정지혁 on 8/27/24.
//

import AVFoundation
import UIKit

enum CameraViewPath {
    case photoPreviewView
    case loadingView
    case resultView
}

struct CameraViewType: Hashable {
    let path: CameraViewPath
    let image: UIImage
    let result: [String: Double]?
}

@Observable
class CameraViewModel: NSObject {
    var path: [CameraViewType] = []
    
    var cameraPreview: CameraPreviewView
    var cameraPosition: AVCaptureDevice.Position = .back
    var capturedImage: UIImage?
    
    let output = AVCapturePhotoOutput()
    
    override init() {
        self.cameraPreview = CameraPreviewView(cameraPosition: .back, output: output)
    }
    
    func changePosition() {
        let position = cameraPosition == .back ? AVCaptureDevice.Position.front : AVCaptureDevice.Position.back
        cameraPosition = position
        cameraPreview.configureCamera(cameraPosition: position)
    }
    
    func capturePhoto() {
        let photoSettings = AVCapturePhotoSettings()
        output.capturePhoto(with: photoSettings, delegate: self)
    }
    
    func savePhoto(_ imageData: Data) {
        guard let image = UIImage(data: imageData) else { return }
        capturedImage = image
        path.append(CameraViewType(path: .photoPreviewView, image: image, result: nil))
    }
}

extension CameraViewModel: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {}
    
    func photoOutput(_ output: AVCapturePhotoOutput, willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {}
    
    func photoOutput(_ output: AVCapturePhotoOutput, didCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {}
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        self.savePhoto(imageData)
    }
}
