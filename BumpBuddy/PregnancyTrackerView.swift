//
//  PregnancyTrackerView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct PregnancyTrackerView: View {
    // Set the start date of the pregnancy
    let startDate = Date() // You should replace this with the actual start date
    
    // Set the duration of pregnancy in weeks
    let pregnancyDurationInWeeks = 40 // Assuming a standard 40-week pregnancy

    var body: some View {
        let currentWeek = calculateCurrentWeek()
        let remainingDays = calculateRemainingDays()

        return VStack {
            Text("Pregnancy Tracker")
                .font(.title)
                .padding()

            Text("Current Week: \(currentWeek)")
                .padding()

            Text("Remaining Days: \(remainingDays)")
                .padding()

            // Add a calendar view or any additional information you want to display
            // ...

        }
    }

    // Calculate the current pregnancy week
    private func calculateCurrentWeek() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekOfYear], from: startDate, to: Date())
        return min(components.weekOfYear ?? 0, pregnancyDurationInWeeks)
    }

    // Calculate the remaining days until labor
    private func calculateRemainingDays() -> Int {
        let calendar = Calendar.current
        let remainingDaysComponents = calendar.dateComponents([.day], from: Date(), to: startDate.addingTimeInterval(Double(pregnancyDurationInWeeks * 7 * 24 * 3600)))
        return max(remainingDaysComponents.day ?? 0, 0)
    }
}

struct PregnancyTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        PregnancyTrackerView()
    }
}
