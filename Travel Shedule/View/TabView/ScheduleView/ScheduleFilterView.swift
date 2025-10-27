import SwiftUI

struct ScheduleFilterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var autoSyncEnabled = true
    
    @State private var first = "square"
    @State private var second = "square"
    @State private var third = "square"
    @State private var fourth = "square"
    
    @State private var yes = "circle"
    @State private var no = "circle"
    @State private var has_transfer = true

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Время отправления")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.ypBlack)
                Spacer()
            }
            .padding(.vertical, 16)
            
            LazyVStack {
                HStack {
                    Text("Утро 06:00 - 12:00")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: first)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            first = first == "square" ?
                            "square.inset.filled" : "square"
                        }
                        
                }
                .padding(.vertical, 10)
                
                HStack {
                    Text("День 12:00 - 18:00")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: second)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            second = second == "square" ?
                            "square.inset.filled" : "square"
                        }
                }
                .padding(.vertical, 10)
                
                HStack {
                    Text("Вечер 18:00 - 00:00")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: third)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            third = third == "square" ?
                            "square.inset.filled" : "square"
                        }
                }
                .padding(.vertical, 10)
            
                HStack {
                    Text("Ночь 00:00 - 06:00")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: fourth)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            fourth = fourth == "square" ?
                            "square.inset.filled" : "square"
                        }
                }
                .padding(.vertical, 10)
                
            }
            HStack {
                Text("Показывать варианты с пересадками")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.ypBlack)
                Spacer()
            }
            .padding(.vertical, 16)
            
            LazyVStack {
                HStack {
                    Text("Да")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: yes)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            has_transfer = true
                            yes = "circle.inset.filled"
                            no = "circle"
                        }
                }
                .padding(.vertical, 10)
            
                HStack {
                    Text("Нет")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: no)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            has_transfer = false
                            no = "circle.inset.filled"
                            yes = "circle"
                        }
                }
                .padding(.vertical, 10)
                
            }
            Spacer()
            
            Button("Применить") {
                presentationMode.wrappedValue.dismiss()
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .tint(.white)
            .background(.ypBlueUniversal)
            .clipShape(.rect(cornerRadius: 16))
            .font(.system(size: 17, weight: .bold))
            .padding(.bottom, 24)
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .background(.ypWhite)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.ypBlack)
                .font(.system(size: 18, weight: .medium))
                .padding(8)
        }
    }
}

#Preview {
    ScheduleFilterView()
}
