//
//  IbanScannerView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI
import AVFoundation
import Vision

struct IbanScannerView: UIViewControllerRepresentable {
  var onIbanNumberDetected: (String) -> Void

  func makeCoordinator() -> Coordinator {
    return Coordinator(self)
  }

  func makeUIViewController(context: Context) -> UIViewController {
    let viewController = UIViewController()
    let captureSession = AVCaptureSession()
    captureSession.sessionPreset = .photo

    guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return viewController }
    let videoInput: AVCaptureDeviceInput

    do {
      videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
    } catch {
      return viewController
    }

    if (captureSession.canAddInput(videoInput)) {
      captureSession.addInput(videoInput)
    } else {
      return viewController
    }

    let videoOutput = AVCaptureVideoDataOutput()
    videoOutput.setSampleBufferDelegate(context.coordinator, queue: DispatchQueue(label: "videoQueue"))
    if (captureSession.canAddOutput(videoOutput)) {
      captureSession.addOutput(videoOutput)
    } else {
      return viewController
    }

    let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    previewLayer.frame = viewController.view.layer.bounds
    previewLayer.videoGravity = .resizeAspectFill
    viewController.view.layer.addSublayer(previewLayer)

    DispatchQueue.global(qos: .userInitiated).async {
      captureSession.startRunning()
    }

    return viewController
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
