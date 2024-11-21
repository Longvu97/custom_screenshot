//
//  SetupView.swift
//  XnapperClone
//
//  Created by Long Vu on 15/11/24.
//

import SwiftUI

struct SetupView: View {
    @EnvironmentObject var setupModel: SetupModel
    @ObservedObject var vm = ScreenShotViewModel()

    let themeColor = Color.orange
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Button(action: {
                vm.takeScreenShot(for: .area)
            }, label: {
                Text("Take Screenshot")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(10)
            })
            .frame(maxWidth: .infinity)
            .background(themeColor)
            .cornerRadius(10)
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 10)
            .keyboardShortcut("1", modifiers: [.control, .option, .command])

            HStack (spacing: 10) {
                Picker(selection: $setupModel.present, label: Text("")) {
                    Text("Your Present").tag("your")
                    Divider()
                    Text("Default Present").tag("default")
                    Text("New Present").tag("new")
                }
                .labelsHidden()
                .tint(themeColor)
                
                Button(action: {
                    print("hello")
                }) {
                    Image(systemName: "trash")
                }
                .buttonStyle(PlainButtonStyle())
            }
            Divider()
            
            SliderSettingView(title: "Padding", range: 300, setting: $setupModel.padding)

            HStack {
                Text("Inset")
                Text("\(Int(setupModel.inset))")
                    .frame(height: 10)
                    .padding(5)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(10)
            }
            
            HStack {
                Slider(value: $setupModel.inset, in: 0...200)
                    .tint(themeColor)
                
                ColorCheckbox(title: "balance", checkboxColor: .orange, isChecked: $setupModel.balance)
                
                ColorPicker("", selection: $setupModel.insetColor)
                    .labelsHidden()
            }
            
            HStack {
                VStack (alignment: .leading) {
                    SliderSettingView(title: "Rounded", range: 50, setting: $setupModel.rounded)
                }
                
                VStack (alignment: .leading) {
                    SliderSettingView(title: "Shadow", range: 100, setting: $setupModel.shadow)
                }
            }
            
            Text("Background")
            
            HStack {
                ForEach(BackGroundImage.allCases, id: \.self) { bg in
                    Button {
                        setupModel.background = AnyView(bg.value)
                    } label: {
                        VStack {
                            bg.value
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            Text(String(describing: bg))
                                .font(.caption)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
            Spacer()
        }
        .frame(width: 210)
        .padding()
    }
    
    
    @ViewBuilder
    func SliderSettingView(title: String, range: Double, setting: Binding<Double>) -> some View {
            HStack {
                Text(title)
                Text("\(Int(setting.wrappedValue))")
                    .frame(height: 10)
                    .padding(5)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(10)
            }

            Slider(value: setting, in: 0...Double(range))
                .tint(themeColor)
        }
}

struct ColorCheckbox: View {
    var title: String
    var checkboxColor: Color = .blue
    @Binding var isChecked: Bool

    var body: some View {
        HStack {
            Toggle(isOn: $isChecked) {
                Text(title)
            }
            .toggleStyle(ColorCheckboxStyle(checkboxColor: checkboxColor))
        }
    }
}

struct ColorCheckboxStyle: ToggleStyle {
    var checkboxColor: Color

    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? checkboxColor : .gray)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    SetupView(vm: ScreenShotViewModel())
        .environmentObject(SetupModel())
}
