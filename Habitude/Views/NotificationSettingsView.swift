import SwiftUI
import UserNotifications

struct NotificationSettingsView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
                
                Button("Planifier une notification") {
                    requestNotificationAuthorization()
                    scheduleNotification()
                }
            }
            .navigationTitle("Notifications")
        }
    }
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Autorisation accordée pour les notifications")
            } else {
                print("Autorisation refusée pour les notifications")
            }
        }
    }
    
    func scheduleNotification() {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Titre de la notification"
        content.body = "Corps de la notification"
        content.sound = .default
        
        // Extraire les composants de l'heure sélectionnée
        let components = Calendar.current.dateComponents([.hour, .minute], from: selectedDate)
        
        // Créer un déclencheur de notification quotidien à l'heure sélectionnée
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        // Créer une demande de notification avec l'identifiant et le contenu spécifiés
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Ajouter la demande de notification au centre de notification
        center.add(request) { error in
            if let error = error {
                print("Erreur lors de la planification de la notification: \(error.localizedDescription)")
            } else {
                print("Notification planifiée avec succès")
            }
        }
    }
}

struct NotificationSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSettingsView()
    }
}
