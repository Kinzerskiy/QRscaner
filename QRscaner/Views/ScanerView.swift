//
//  ScanerView.swift
//  QRscaner
//
//  Created by Mac Pro on 11.07.2023.
//

import SwiftUI
import CodeScanner

struct ScanerView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan QR code"
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            Button("Scan QR code") {
                self.isPresentingScanner = true
            }
            
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ScanerView()
        }
    }
