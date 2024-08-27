import Foundation
import AVFoundation
import SwiftUI

struct CameraPreviewView: UIViewRepresentable {
    private let cameraQueue = DispatchQueue(label: "cameraQueue")
    private let output: AVCapturePhotoOutput
    
    private var captureSession = AVCaptureSession()
    private var currentInput: AVCaptureDeviceInput?
    
    init(cameraPosition: AVCaptureDevice.Position, output: AVCapturePhotoOutput) {
        self.output = output
        configureCaptureSession(cameraPosition: cameraPosition)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = PreviewView()
        view.backgroundColor = .black
        if let previewLayer = view.previewLayer {
            previewLayer.session = captureSession
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.connection?.videoRotationAngle = 90.0
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // do nothing
    }
    
    func requestCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { authStatus in
                if authStatus {
                    self.cameraQueue.async {
                        if captureSession.canAddOutput(output) {
                            captureSession.addOutput(output)
                            output.isHighResolutionCaptureEnabled = true
                            output.maxPhotoQualityPrioritization = .quality
                        }
                        self.captureSession.startRunning()
                    }
                }
            }
        case .restricted:
            break
        case .authorized:
            self.cameraQueue.async {
                if captureSession.canAddOutput(output) {
                    captureSession.addOutput(output)
                    output.isHighResolutionCaptureEnabled = true
                    output.maxPhotoQualityPrioritization = .quality
                }
                self.captureSession.startRunning()
            }
        default:
            print("Permession declined")
        }
    }
    
    private mutating func configureCaptureSession(cameraPosition: AVCaptureDevice.Position) {
        let videoOutput = AVCaptureVideoDataOutput()
        self.captureSession.addOutput(videoOutput)
        
        configureCamera(cameraPosition: cameraPosition)
    }
    
    mutating func configureCamera(cameraPosition: AVCaptureDevice.Position) {
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera,.builtInUltraWideCamera], mediaType: .video, position: cameraPosition)
        
        guard let cameraDevice = discoverySession.devices.first else {
            fatalError("no camera device is available")
        }
        
        do {
            if let currentInput = currentInput {
                self.captureSession.removeInput(currentInput)
            }
            let deviceInput = try AVCaptureDeviceInput(device: cameraDevice)
            self.captureSession.addInput(deviceInput)
            self.currentInput = deviceInput
        } catch {
            print("error = \(error.localizedDescription)")
        }
    }
}

fileprivate class PreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var previewLayer: AVCaptureVideoPreviewLayer? {
        return layer as? AVCaptureVideoPreviewLayer
    }
}
