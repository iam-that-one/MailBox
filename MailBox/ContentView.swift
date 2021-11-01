//
//  ContentView.swift
//  MailBox
//
//  Created by Abdullah Alnutayfi on 09/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State var emails : [Email] = [Email(sender: "Tuwiq Academy", subject: "About Bootcamp", body: "congrat Abdullah! We have accepted you to join us in IOS development path among 200000 applicants", isRead: false, time: "8:00 AM"),Email(sender: "Tuwiq Academy", subject: "About Bootcamp", body: "congrat Abdullah! We have accepted you to join us in IOS development path among 200000 applicants", isRead: false, time: "8:00 AM"),Email(sender: "Tuwiq Academy", subject: "About Bootcamp", body: "congrat Abdullah! We have accepted you to join us in IOS development path among 200000 applicants", isRead: true, time: "8:00 AM"),Email(sender: "Tuwiq Academy", subject: "About Bootcamp", body: "congrat Abdullah! We have accepted you to join us in IOS development path among 200000 applicants", isRead: true, time: "8:00 AM"),Email(sender: "Tuwiq Academy", subject: "About Bootcamp", body: "congrat Abdullah! We have accepted you to join us in IOS development path among 200000 applicants", isRead: false, time: "8:00 AM"),Email(sender: "Tuwiq Academy", subject: "About Bootcamp", body: "congrat Abdullah! We have accepted you to join us in IOS development path among 200000 applicants", isRead: false, time: "8:00 AM"),Email(sender: "Tuwiq Academy", subject: "About Bootcamp", body: "congrat Abdullah! We have accepted you to join us in IOS development path among 200000 applicants", isRead: true, time: "8:00 AM"),Email(sender: "Tuwiq Academy", subject: "About Bootcamp", body: "congrat Abdullah! We have accepted you to join us in IOS development path among 200000 applicants", isRead: false, time: "8:00 AM")]
    @State var text = ""
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom) {
                VStack{
                    Spacer()
                    if #available(iOS 15.0, *) {
                        List{
                            ForEach(emails) { email in
                                
                                VStack (alignment: .leading, spacing: 5){
                                    NavigationLink(destination: Text("")) {
                                        HStack{
                                            Image(systemName: "circlebadge.fill")
                                                .foregroundColor(email.isRead ? .white : .blue)
                                                .offset(x:-15)
                                            Text(email.sender)
                                                .fontWeight(.bold)
                                                .offset(x:-18)
                                            Spacer()
                                            Text(email.time)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    Text(email.body)
                                        .offset(x:5)
                                }
                                
                            }
                        }.listStyle(PlainListStyle())
                            .searchable(text: $text)
                    } else {
                        // Fallback on earlier versions
                    }
                }.navigationBarTitle(Text("All Inboxes"),displayMode: .large)
                    .navigationBarItems(leading:
                                            HStack{
                        HStack(spacing: 10){
                            Image(systemName: "chevron.backward")
                            Text("Mailboxes")
                            Spacer()
                        }.foregroundColor(.blue)
                    }
                    )
                    .navigationBarItems(
                        trailing:
                                Text("Edit")
                                    .foregroundColor(.blue)
                    )
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 80)
                    .foregroundColor(Color(.systemGray6))
                    .overlay(Rectangle().stroke().fill(Color(.systemGray4)))
                    .overlay(
                        HStack(spacing: 80){
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                            
                            VStack{
                                Text("Updated on \(dateFormatter.string(from: Date()))")
                                    .multilineTextAlignment(.center)
                                    .font(.caption)
                                    .offset(y: -10)
                            }
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                        }
                    )
            }.ignoresSafeArea()
            
            
        }
        
    }
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        formatter.dateStyle = .medium
        // formatter.timeStyle = .short
        return formatter
    }()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Email : Identifiable{
    var id = UUID()
    var sender : String
    var subject : String
    var body : String
    var isRead : Bool
    var time : String
}
