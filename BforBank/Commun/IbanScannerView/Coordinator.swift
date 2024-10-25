//
//  Coordinator.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//
import SwiftUI
import AVFoundation
import Vision

class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
  var parent: IbanScannerView
  var visionRequest = [VNRequest]()

  init(_ parent: IbanScannerView) {
    self.parent = parent
    super.init()
    setupVision()
  }

  func setupVision() {
    let textRequest = VNRecognizeTextRequest(completionHandler: self.handleDetectedText)
    self.visionRequest = [textRequest]
  }

  func handleDetectedText(request: VNRequest?, error: Error?) {
    guard let observations = request?.results as? [VNRecognizedTextObservation] else { return }
    var ibanNumber: String?

    for observation in observations {
      guard let candidate = observation.topCandidates(1).first else { continue }
      let text = candidate.string.replacingOccurrences(of: " ", with: "")
        if text.isValidIBAN() {
          ibanNumber = text
        break
      }
    }

    if let ibanNumber = ibanNumber {
      DispatchQueue.main.async {
        self.parent.onIbanNumberDetected(ibanNumber)
      }
    }
  }

  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    let pixelBuffer: CVPixelBuffer? = CMSampleBufferGetImageBuffer(sampleBuffer)
    var requestOptions:[VNImageOption: Any] = [:]

    if let cameraData = CMGetAttachment(sampleBuffer, key: kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, attachmentModeOut: nil) {
      requestOptions = [.cameraIntrinsics: cameraData]
    }

    guard let pixelBuffer = pixelBuffer else { return }

    let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .right, options: requestOptions)
    do {
      try imageRequestHandler.perform(self.visionRequest)
    } catch {
      print(error)
    }
  }
}


