import WidgetKit
import SwiftUI

struct NodeStatusWidget: Widget {

    let supportedFamilies: [WidgetFamily];

    init() {
        if #available(iOSApplicationExtension 16.0, *) {
            self.supportedFamilies = [.systemSmall, .systemMedium, .accessoryRectangular, .accessoryInline]
        } else {
            self.supportedFamilies = [.systemSmall, .systemMedium]
        }
    }

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "cz.yanas.bitcoin.NodeStatusWidget", intent: ConfigurationIntent.self, provider: NodeStatusProvider()) { entry in
            NodeStatusView(nodeStatus: entry)
        }
        .configurationDisplayName("Node Status")
        .description("See status of your full node.")
        .supportedFamilies(supportedFamilies)
    }

}
