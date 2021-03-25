//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let resType = try ResType(json)
//
//import Foundation
//
//// MARK: - ResType
//class ResType: Codable {
//    let timestamp: String?
//    let status: Int?
//    let message: String?
//    let data: DataClass?
//
//    init(timestamp: String?, status: Int?, message: String?, data: DataClass?) {
//        self.timestamp = timestamp
//        self.status = status
//        self.message = message
//        self.data = data
//    }
//}
//
//// MARK: ResType convenience initializers and mutators
//
//extension ResType {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(ResType.self, from: data)
//        self.init(timestamp: me.timestamp, status: me.status, message: me.message, data: me.data)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        timestamp: String?? = nil,
//        status: Int?? = nil,
//        message: String?? = nil,
//        data: DataClass?? = nil
//    ) -> ResType {
//        return ResType(
//            timestamp: timestamp ?? self.timestamp,
//            status: status ?? self.status,
//            message: message ?? self.message,
//            data: data ?? self.data
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - DataClass
//class DataClass: Codable {
//    let routes: [BaatoRoute]?
//    let waypoints: [BaatoWaypoint]?
//    let code, uuid: String?
//
//    init(routes: [BaatoRoute]?, waypoints: [BaatoWaypoint]?, code: String?, uuid: String?) {
//        self.routes = routes
//        self.waypoints = waypoints
//        self.code = code
//        self.uuid = uuid
//    }
//}
//
//// MARK: DataClass convenience initializers and mutators
//
//extension DataClass {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(DataClass.self, from: data)
//        self.init(routes: me.routes, waypoints: me.waypoints, code: me.code, uuid: me.uuid)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        routes: [BaatoRoute]?? = nil,
//        waypoints: [BaatoWaypoint]?? = nil,
//        code: String?? = nil,
//        uuid: String?? = nil
//    ) -> DataClass {
//        return DataClass(
//            routes: routes ?? self.routes,
//            waypoints: waypoints ?? self.waypoints,
//            code: code ?? self.code,
//            uuid: uuid ?? self.uuid
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Route
//class BaatoRoute: Codable {
//    let geometry: String?
//    let legs: [Leg]?
//    let weightName: String?
//    let weight: Int?
//    let duration, distance: Double?
//    let routeOptions: RouteOptions?
//    let voiceLocale: String?
//
//    enum CodingKeys: String, CodingKey {
//        case geometry, legs
//        case weightName
//        case weight, duration, distance, routeOptions, voiceLocale
//    }
//
//    init(geometry: String?, legs: [Leg]?, weightName: String?, weight: Int?, duration: Double?, distance: Double?, routeOptions: RouteOptions?, voiceLocale: String?) {
//        self.geometry = geometry
//        self.legs = legs
//        self.weightName = weightName
//        self.weight = weight
//        self.duration = duration
//        self.distance = distance
//        self.routeOptions = routeOptions
//        self.voiceLocale = voiceLocale
//    }
//}
//
//// MARK: Route convenience initializers and mutators
//
//extension BaatoRoute {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(BaatoRoute.self, from: data)
//        self.init(geometry: me.geometry, legs: me.legs, weightName: me.weightName, weight: me.weight, duration: me.duration, distance: me.distance, routeOptions: me.routeOptions, voiceLocale: me.voiceLocale)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        geometry: String?? = nil,
//        legs: [Leg]?? = nil,
//        weightName: String?? = nil,
//        weight: Int?? = nil,
//        duration: Double?? = nil,
//        distance: Double?? = nil,
//        routeOptions: RouteOptions?? = nil,
//        voiceLocale: String?? = nil
//    ) -> BaatoRoute {
//        return BaatoRoute(
//            geometry: geometry ?? self.geometry,
//            legs: legs ?? self.legs,
//            weightName: weightName ?? self.weightName,
//            weight: weight ?? self.weight,
//            duration: duration ?? self.duration,
//            distance: distance ?? self.distance,
//            routeOptions: routeOptions ?? self.routeOptions,
//            voiceLocale: voiceLocale ?? self.voiceLocale
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Leg
//class Leg: Codable {
//    let steps: [Step]?
//    let summary: String?
//    let weight, duration, distance: Double?
//
//    init(steps: [Step]?, summary: String?, weight: Double?, duration: Double?, distance: Double?) {
//        self.steps = steps
//        self.summary = summary
//        self.weight = weight
//        self.duration = duration
//        self.distance = distance
//    }
//}
//
//// MARK: Leg convenience initializers and mutators
//
//extension Leg {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Leg.self, from: data)
//        self.init(steps: me.steps, summary: me.summary, weight: me.weight, duration: me.duration, distance: me.distance)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        steps: [Step]?? = nil,
//        summary: String?? = nil,
//        weight: Double?? = nil,
//        duration: Double?? = nil,
//        distance: Double?? = nil
//    ) -> Leg {
//        return Leg(
//            steps: steps ?? self.steps,
//            summary: summary ?? self.summary,
//            weight: weight ?? self.weight,
//            duration: duration ?? self.duration,
//            distance: distance ?? self.distance
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Step
//class Step: Codable {
//    let intersections: [Intersection]?
//    let drivingSide: DrivingSide?
//    let geometry: String?
//    let mode: Profile?
//    let maneuver: Maneuver?
//    let weight, duration: Double?
//    let name: String?
//    let distance: Double?
//    let voiceInstructions: [VoiceInstruction]?
//    let bannerInstructions: [BannerInstruction]?
//
//    enum CodingKeys: String, CodingKey {
//        case intersections
//        case drivingSide
//        case geometry, mode, maneuver, weight, duration, name, distance, voiceInstructions, bannerInstructions
//    }
//
//    init(intersections: [Intersection]?, drivingSide: DrivingSide?, geometry: String?, mode: Profile?, maneuver: Maneuver?, weight: Double?, duration: Double?, name: String?, distance: Double?, voiceInstructions: [VoiceInstruction]?, bannerInstructions: [BannerInstruction]?) {
//        self.intersections = intersections
//        self.drivingSide = drivingSide
//        self.geometry = geometry
//        self.mode = mode
//        self.maneuver = maneuver
//        self.weight = weight
//        self.duration = duration
//        self.name = name
//        self.distance = distance
//        self.voiceInstructions = voiceInstructions
//        self.bannerInstructions = bannerInstructions
//    }
//}
//
//// MARK: Step convenience initializers and mutators
//
//extension Step {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Step.self, from: data)
//        self.init(intersections: me.intersections, drivingSide: me.drivingSide, geometry: me.geometry, mode: me.mode, maneuver: me.maneuver, weight: me.weight, duration: me.duration, name: me.name, distance: me.distance, voiceInstructions: me.voiceInstructions, bannerInstructions: me.bannerInstructions)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        intersections: [Intersection]?? = nil,
//        drivingSide: DrivingSide?? = nil,
//        geometry: String?? = nil,
//        mode: Profile?? = nil,
//        maneuver: Maneuver?? = nil,
//        weight: Double?? = nil,
//        duration: Double?? = nil,
//        name: String?? = nil,
//        distance: Double?? = nil,
//        voiceInstructions: [VoiceInstruction]?? = nil,
//        bannerInstructions: [BannerInstruction]?? = nil
//    ) -> Step {
//        return Step(
//            intersections: intersections ?? self.intersections,
//            drivingSide: drivingSide ?? self.drivingSide,
//            geometry: geometry ?? self.geometry,
//            mode: mode ?? self.mode,
//            maneuver: maneuver ?? self.maneuver,
//            weight: weight ?? self.weight,
//            duration: duration ?? self.duration,
//            name: name ?? self.name,
//            distance: distance ?? self.distance,
//            voiceInstructions: voiceInstructions ?? self.voiceInstructions,
//            bannerInstructions: bannerInstructions ?? self.bannerInstructions
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - BannerInstruction
//class BannerInstruction: Codable {
//    let distanceAlongGeometry: Double?
//    let primary: Primary?
//    let secondary: JSONNull?
//    let sub: Primary?
//
//    init(distanceAlongGeometry: Double?, primary: Primary?, secondary: JSONNull?, sub: Primary?) {
//        self.distanceAlongGeometry = distanceAlongGeometry
//        self.primary = primary
//        self.secondary = secondary
//        self.sub = sub
//    }
//}
//
//// MARK: BannerInstruction convenience initializers and mutators
//
//extension BannerInstruction {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(BannerInstruction.self, from: data)
//        self.init(distanceAlongGeometry: me.distanceAlongGeometry, primary: me.primary, secondary: me.secondary, sub: me.sub)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        distanceAlongGeometry: Double?? = nil,
//        primary: Primary?? = nil,
//        secondary: JSONNull?? = nil,
//        sub: Primary?? = nil
//    ) -> BannerInstruction {
//        return BannerInstruction(
//            distanceAlongGeometry: distanceAlongGeometry ?? self.distanceAlongGeometry,
//            primary: primary ?? self.primary,
//            secondary: secondary ?? self.secondary,
//            sub: sub ?? self.sub
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Primary
//class Primary: Codable {
//    let text: String?
//    let components: [Component]?
//    let type: PrimaryType?
//    let modifier: String?
//    let degrees: Int?
//
//    init(text: String?, components: [Component]?, type: PrimaryType?, modifier: String?, degrees: Int?) {
//        self.text = text
//        self.components = components
//        self.type = type
//        self.modifier = modifier
//        self.degrees = degrees
//    }
//}
//
//// MARK: Primary convenience initializers and mutators
//
//extension Primary {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Primary.self, from: data)
//        self.init(text: me.text, components: me.components, type: me.type, modifier: me.modifier, degrees: me.degrees)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        text: String?? = nil,
//        components: [Component]?? = nil,
//        type: PrimaryType?? = nil,
//        modifier: String?? = nil,
//        degrees: Int?? = nil
//    ) -> Primary {
//        return Primary(
//            text: text ?? self.text,
//            components: components ?? self.components,
//            type: type ?? self.type,
//            modifier: modifier ?? self.modifier,
//            degrees: degrees ?? self.degrees
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Component
//class Component: Codable {
//    let text: String?
//    let type: ComponentType?
//
//    init(text: String?, type: ComponentType?) {
//        self.text = text
//        self.type = type
//    }
//}
//
//// MARK: Component convenience initializers and mutators
//
//extension Component {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Component.self, from: data)
//        self.init(text: me.text, type: me.type)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        text: String?? = nil,
//        type: ComponentType?? = nil
//    ) -> Component {
//        return Component(
//            text: text ?? self.text,
//            type: type ?? self.type
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//enum ComponentType: String, Codable {
//    case text = "text"
//}
//
//enum PrimaryType: String, Codable {
//    case arrive = "arrive"
//    case depart = "depart"
//    case roundabout = "roundabout"
//    case turn = "turn"
//}
//
//enum DrivingSide: String, Codable {
//    case drivingSideLeft = "left"
//}
//
//// MARK: - Intersection
//class Intersection: Codable {
//    let out: Int?
//    let entry: [Bool]?
//    let bearings: [Int]?
//    let location: [Double]?
//
//    init(out: Int?, entry: [Bool]?, bearings: [Int]?, location: [Double]?) {
//        self.out = out
//        self.entry = entry
//        self.bearings = bearings
//        self.location = location
//    }
//}
//
//// MARK: Intersection convenience initializers and mutators
//
//extension Intersection {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Intersection.self, from: data)
//        self.init(out: me.out, entry: me.entry, bearings: me.bearings, location: me.location)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        out: Int?? = nil,
//        entry: [Bool]?? = nil,
//        bearings: [Int]?? = nil,
//        location: [Double]?? = nil
//    ) -> Intersection {
//        return Intersection(
//            out: out ?? self.out,
//            entry: entry ?? self.entry,
//            bearings: bearings ?? self.bearings,
//            location: location ?? self.location
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Maneuver
//class Maneuver: Codable {
//    let bearingAfter, bearingBefore: Int?
//    let location: [Double]?
//    let modifier: String?
//    let type: PrimaryType?
//    let instruction: String?
//    let exit: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case bearingAfter
//        case bearingBefore
//        case location, modifier, type, instruction, exit
//    }
//
//    init(bearingAfter: Int?, bearingBefore: Int?, location: [Double]?, modifier: String?, type: PrimaryType?, instruction: String?, exit: Int?) {
//        self.bearingAfter = bearingAfter
//        self.bearingBefore = bearingBefore
//        self.location = location
//        self.modifier = modifier
//        self.type = type
//        self.instruction = instruction
//        self.exit = exit
//    }
//}
//
//// MARK: Maneuver convenience initializers and mutators
//
//extension Maneuver {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Maneuver.self, from: data)
//        self.init(bearingAfter: me.bearingAfter, bearingBefore: me.bearingBefore, location: me.location, modifier: me.modifier, type: me.type, instruction: me.instruction, exit: me.exit)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        bearingAfter: Int?? = nil,
//        bearingBefore: Int?? = nil,
//        location: [Double]?? = nil,
//        modifier: String?? = nil,
//        type: PrimaryType?? = nil,
//        instruction: String?? = nil,
//        exit: Int?? = nil
//    ) -> Maneuver {
//        return Maneuver(
//            bearingAfter: bearingAfter ?? self.bearingAfter,
//            bearingBefore: bearingBefore ?? self.bearingBefore,
//            location: location ?? self.location,
//            modifier: modifier ?? self.modifier,
//            type: type ?? self.type,
//            instruction: instruction ?? self.instruction,
//            exit: exit ?? self.exit
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//enum Profile: String, Codable {
//    case driving = "driving"
//}
//
//// MARK: - VoiceInstruction
//class VoiceInstruction: Codable {
//    let distanceAlongGeometry: Double?
//    let announcement, ssmlAnnouncement: String?
//
//    init(distanceAlongGeometry: Double?, announcement: String?, ssmlAnnouncement: String?) {
//        self.distanceAlongGeometry = distanceAlongGeometry
//        self.announcement = announcement
//        self.ssmlAnnouncement = ssmlAnnouncement
//    }
//}
//
//// MARK: VoiceInstruction convenience initializers and mutators
//
//extension VoiceInstruction {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(VoiceInstruction.self, from: data)
//        self.init(distanceAlongGeometry: me.distanceAlongGeometry, announcement: me.announcement, ssmlAnnouncement: me.ssmlAnnouncement)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        distanceAlongGeometry: Double?? = nil,
//        announcement: String?? = nil,
//        ssmlAnnouncement: String?? = nil
//    ) -> VoiceInstruction {
//        return VoiceInstruction(
//            distanceAlongGeometry: distanceAlongGeometry ?? self.distanceAlongGeometry,
//            announcement: announcement ?? self.announcement,
//            ssmlAnnouncement: ssmlAnnouncement ?? self.ssmlAnnouncement
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - RouteOptions
//class RouteOptions: Codable {
//    let baseURL: String?
//    let user: String?
//    let profile: Profile?
//    let coordinates: [[Double]]?
//    let language, bearings: String?
//    let continueStraight, roundaboutExits: Bool?
//    let geometries, overview: String?
//    let steps: Bool?
//    let annotations: String?
//    let voiceInstructions, bannerInstructions: Bool?
//    let voiceUnits, accessToken, requestUUID: String?
//
//    enum CodingKeys: String, CodingKey {
//        case baseURL
//        case user, profile, coordinates, language, bearings, continueStraight, roundaboutExits, geometries, overview, steps, annotations, voiceInstructions, bannerInstructions, voiceUnits, accessToken
//        case requestUUID
//    }
//
//    init(baseURL: String?, user: String?, profile: Profile?, coordinates: [[Double]]?, language: String?, bearings: String?, continueStraight: Bool?, roundaboutExits: Bool?, geometries: String?, overview: String?, steps: Bool?, annotations: String?, voiceInstructions: Bool?, bannerInstructions: Bool?, voiceUnits: String?, accessToken: String?, requestUUID: String?) {
//        self.baseURL = baseURL
//        self.user = user
//        self.profile = profile
//        self.coordinates = coordinates
//        self.language = language
//        self.bearings = bearings
//        self.continueStraight = continueStraight
//        self.roundaboutExits = roundaboutExits
//        self.geometries = geometries
//        self.overview = overview
//        self.steps = steps
//        self.annotations = annotations
//        self.voiceInstructions = voiceInstructions
//        self.bannerInstructions = bannerInstructions
//        self.voiceUnits = voiceUnits
//        self.accessToken = accessToken
//        self.requestUUID = requestUUID
//    }
//}
//
//// MARK: RouteOptions convenience initializers and mutators
//
//extension RouteOptions {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(RouteOptions.self, from: data)
//        self.init(baseURL: me.baseURL, user: me.user, profile: me.profile, coordinates: me.coordinates, language: me.language, bearings: me.bearings, continueStraight: me.continueStraight, roundaboutExits: me.roundaboutExits, geometries: me.geometries, overview: me.overview, steps: me.steps, annotations: me.annotations, voiceInstructions: me.voiceInstructions, bannerInstructions: me.bannerInstructions, voiceUnits: me.voiceUnits, accessToken: me.accessToken, requestUUID: me.requestUUID)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        baseURL: String?? = nil,
//        user: String?? = nil,
//        profile: Profile?? = nil,
//        coordinates: [[Double]]?? = nil,
//        language: String?? = nil,
//        bearings: String?? = nil,
//        continueStraight: Bool?? = nil,
//        roundaboutExits: Bool?? = nil,
//        geometries: String?? = nil,
//        overview: String?? = nil,
//        steps: Bool?? = nil,
//        annotations: String?? = nil,
//        voiceInstructions: Bool?? = nil,
//        bannerInstructions: Bool?? = nil,
//        voiceUnits: String?? = nil,
//        accessToken: String?? = nil,
//        requestUUID: String?? = nil
//    ) -> RouteOptions {
//        return RouteOptions(
//            baseURL: baseURL ?? self.baseURL,
//            user: user ?? self.user,
//            profile: profile ?? self.profile,
//            coordinates: coordinates ?? self.coordinates,
//            language: language ?? self.language,
//            bearings: bearings ?? self.bearings,
//            continueStraight: continueStraight ?? self.continueStraight,
//            roundaboutExits: roundaboutExits ?? self.roundaboutExits,
//            geometries: geometries ?? self.geometries,
//            overview: overview ?? self.overview,
//            steps: steps ?? self.steps,
//            annotations: annotations ?? self.annotations,
//            voiceInstructions: voiceInstructions ?? self.voiceInstructions,
//            bannerInstructions: bannerInstructions ?? self.bannerInstructions,
//            voiceUnits: voiceUnits ?? self.voiceUnits,
//            accessToken: accessToken ?? self.accessToken,
//            requestUUID: requestUUID ?? self.requestUUID
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Waypoint
//class BaatoWaypoint: Codable {
//    let name: String?
//    let location: [Double]?
//
//    init(name: String?, location: [Double]?) {
//        self.name = name
//        self.location = location
//    }
//}
//
//// MARK: Waypoint convenience initializers and mutators
//
//extension BaatoWaypoint {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(BaatoWaypoint.self, from: data)
//        self.init(name: me.name, location: me.location)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        name: String?? = nil,
//        location: [Double]?? = nil
//    ) -> BaatoWaypoint {
//        return BaatoWaypoint(
//            name: name ?? self.name,
//            location: location ?? self.location
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let resType = try ResType(json)

import Foundation

// MARK: - ResType
class ResType: Codable {
    let timestamp: String?
    let status: Int?
    let message: String?
    let data: DataClass?

    init(timestamp: String?, status: Int?, message: String?, data: DataClass?) {
        self.timestamp = timestamp
        self.status = status
        self.message = message
        self.data = data
    }
}

// MARK: ResType convenience initializers and mutators

extension ResType {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ResType.self, from: data)
        self.init(timestamp: me.timestamp, status: me.status, message: me.message, data: me.data)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        timestamp: String?? = nil,
        status: Int?? = nil,
        message: String?? = nil,
        data: DataClass?? = nil
    ) -> ResType {
        return ResType(
            timestamp: timestamp ?? self.timestamp,
            status: status ?? self.status,
            message: message ?? self.message,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DataClass
class DataClass: Codable {
    let routes: [BaatoRoute]?
    let waypoints: [BaatoWaypoint]?
    let code, uuid: String?

    init(routes: [BaatoRoute]?, waypoints: [BaatoWaypoint]?, code: String?, uuid: String?) {
        self.routes = routes
        self.waypoints = waypoints
        self.code = code
        self.uuid = uuid
    }
}

// MARK: DataClass convenience initializers and mutators

extension DataClass {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DataClass.self, from: data)
        self.init(routes: me.routes, waypoints: me.waypoints, code: me.code, uuid: me.uuid)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        routes: [BaatoRoute]?? = nil,
        waypoints: [BaatoWaypoint]?? = nil,
        code: String?? = nil,
        uuid: String?? = nil
    ) -> DataClass {
        return DataClass(
            routes: routes ?? self.routes,
            waypoints: waypoints ?? self.waypoints,
            code: code ?? self.code,
            uuid: uuid ?? self.uuid
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - BaatoRoute
class BaatoRoute: Codable {
    let geometry: String?
    let legs: [Leg]?
    let weightName: String?
    let weight: Int?
    let duration, distance: Double?
    let routeOptions: RouteOptions?
    let voiceLocale: String?

    enum CodingKeys: String, CodingKey {
        case geometry, legs
        case weightName
        case weight, duration, distance, routeOptions, voiceLocale
    }

    init(geometry: String?, legs: [Leg]?, weightName: String?, weight: Int?, duration: Double?, distance: Double?, routeOptions: RouteOptions?, voiceLocale: String?) {
        self.geometry = geometry
        self.legs = legs
        self.weightName = weightName
        self.weight = weight
        self.duration = duration
        self.distance = distance
        self.routeOptions = routeOptions
        self.voiceLocale = voiceLocale
    }
}

// MARK: Route convenience initializers and mutators

extension BaatoRoute {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(BaatoRoute.self, from: data)
        self.init(geometry: me.geometry, legs: me.legs, weightName: me.weightName, weight: me.weight, duration: me.duration, distance: me.distance, routeOptions: me.routeOptions, voiceLocale: me.voiceLocale)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        geometry: String?? = nil,
        legs: [Leg]?? = nil,
        weightName: String?? = nil,
        weight: Int?? = nil,
        duration: Double?? = nil,
        distance: Double?? = nil,
        routeOptions: RouteOptions?? = nil,
        voiceLocale: String?? = nil
    ) -> BaatoRoute {
        return BaatoRoute(
            geometry: geometry ?? self.geometry,
            legs: legs ?? self.legs,
            weightName: weightName ?? self.weightName,
            weight: weight ?? self.weight,
            duration: duration ?? self.duration,
            distance: distance ?? self.distance,
            routeOptions: routeOptions ?? self.routeOptions,
            voiceLocale: voiceLocale ?? self.voiceLocale
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Leg
class Leg: Codable {
    let steps: [Step]?
    let summary: String?
    let weight, duration, distance: Double?

    init(steps: [Step]?, summary: String?, weight: Double?, duration: Double?, distance: Double?) {
        self.steps = steps
        self.summary = summary
        self.weight = weight
        self.duration = duration
        self.distance = distance
    }
}

// MARK: Leg convenience initializers and mutators

extension Leg {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Leg.self, from: data)
        self.init(steps: me.steps, summary: me.summary, weight: me.weight, duration: me.duration, distance: me.distance)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        steps: [Step]?? = nil,
        summary: String?? = nil,
        weight: Double?? = nil,
        duration: Double?? = nil,
        distance: Double?? = nil
    ) -> Leg {
        return Leg(
            steps: steps ?? self.steps,
            summary: summary ?? self.summary,
            weight: weight ?? self.weight,
            duration: duration ?? self.duration,
            distance: distance ?? self.distance
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Step
class Step: Codable {
    let intersections: [Intersection]?
    let drivingSide: DrivingSide?
    let geometry: String?
    let mode: Profile?
    let maneuver: Maneuver?
    let weight, duration: Double?
    let name: String?
    let distance: Double?
    let voiceInstructions: [VoiceInstruction]?
    let bannerInstructions: [BannerInstruction]?

    enum CodingKeys: String, CodingKey {
        case intersections
        case drivingSide
        case geometry, mode, maneuver, weight, duration, name, distance, voiceInstructions, bannerInstructions
    }

    init(intersections: [Intersection]?, drivingSide: DrivingSide?, geometry: String?, mode: Profile?, maneuver: Maneuver?, weight: Double?, duration: Double?, name: String?, distance: Double?, voiceInstructions: [VoiceInstruction]?, bannerInstructions: [BannerInstruction]?) {
        self.intersections = intersections
        self.drivingSide = drivingSide
        self.geometry = geometry
        self.mode = mode
        self.maneuver = maneuver
        self.weight = weight
        self.duration = duration
        self.name = name
        self.distance = distance
        self.voiceInstructions = voiceInstructions
        self.bannerInstructions = bannerInstructions
    }
}

// MARK: Step convenience initializers and mutators

extension Step {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Step.self, from: data)
        self.init(intersections: me.intersections, drivingSide: me.drivingSide, geometry: me.geometry, mode: me.mode, maneuver: me.maneuver, weight: me.weight, duration: me.duration, name: me.name, distance: me.distance, voiceInstructions: me.voiceInstructions, bannerInstructions: me.bannerInstructions)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        intersections: [Intersection]?? = nil,
        drivingSide: DrivingSide?? = nil,
        geometry: String?? = nil,
        mode: Profile?? = nil,
        maneuver: Maneuver?? = nil,
        weight: Double?? = nil,
        duration: Double?? = nil,
        name: String?? = nil,
        distance: Double?? = nil,
        voiceInstructions: [VoiceInstruction]?? = nil,
        bannerInstructions: [BannerInstruction]?? = nil
    ) -> Step {
        return Step(
            intersections: intersections ?? self.intersections,
            drivingSide: drivingSide ?? self.drivingSide,
            geometry: geometry ?? self.geometry,
            mode: mode ?? self.mode,
            maneuver: maneuver ?? self.maneuver,
            weight: weight ?? self.weight,
            duration: duration ?? self.duration,
            name: name ?? self.name,
            distance: distance ?? self.distance,
            voiceInstructions: voiceInstructions ?? self.voiceInstructions,
            bannerInstructions: bannerInstructions ?? self.bannerInstructions
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - BannerInstruction
class BannerInstruction: Codable {
    let distanceAlongGeometry: Double?
    let primary: Primary?
    let secondary: JSONNull?
    let sub: Primary?

    init(distanceAlongGeometry: Double?, primary: Primary?, secondary: JSONNull?, sub: Primary?) {
        self.distanceAlongGeometry = distanceAlongGeometry
        self.primary = primary
        self.secondary = secondary
        self.sub = sub
    }
}

// MARK: BannerInstruction convenience initializers and mutators

extension BannerInstruction {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(BannerInstruction.self, from: data)
        self.init(distanceAlongGeometry: me.distanceAlongGeometry, primary: me.primary, secondary: me.secondary, sub: me.sub)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        distanceAlongGeometry: Double?? = nil,
        primary: Primary?? = nil,
        secondary: JSONNull?? = nil,
        sub: Primary?? = nil
    ) -> BannerInstruction {
        return BannerInstruction(
            distanceAlongGeometry: distanceAlongGeometry ?? self.distanceAlongGeometry,
            primary: primary ?? self.primary,
            secondary: secondary ?? self.secondary,
            sub: sub ?? self.sub
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Primary
class Primary: Codable {
    let text: String?
    let components: [Component]?
    let type: PrimaryType?
    let modifier: String?
    let degrees: Double?

    init(text: String?, components: [Component]?, type: PrimaryType?, modifier: String?, degrees: Double?) {
        self.text = text
        self.components = components
        self.type = type
        self.modifier = modifier
        self.degrees = degrees
    }
}

// MARK: Primary convenience initializers and mutators

extension Primary {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Primary.self, from: data)
        self.init(text: me.text, components: me.components, type: me.type, modifier: me.modifier, degrees: me.degrees)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        text: String?? = nil,
        components: [Component]?? = nil,
        type: PrimaryType?? = nil,
        modifier: String?? = nil,
        degrees: Double?? = nil
    ) -> Primary {
        return Primary(
            text: text ?? self.text,
            components: components ?? self.components,
            type: type ?? self.type,
            modifier: modifier ?? self.modifier,
            degrees: degrees ?? self.degrees
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Component
class Component: Codable {
    let text: String?
    let type: ComponentType?

    init(text: String?, type: ComponentType?) {
        self.text = text
        self.type = type
    }
}

// MARK: Component convenience initializers and mutators

extension Component {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Component.self, from: data)
        self.init(text: me.text, type: me.type)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        text: String?? = nil,
        type: ComponentType?? = nil
    ) -> Component {
        return Component(
            text: text ?? self.text,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum ComponentType: String, Codable {
    case text = "text"
}

enum PrimaryType: String, Codable {
    case arrive = "arrive"
    case depart = "depart"
    case roundabout = "roundabout"
    case turn = "turn"
}

enum DrivingSide: String, Codable {
    case drivingSideLeft = "left"
}

// MARK: - Intersection
class Intersection: Codable {
    let out: Int?
    let entry: [Bool]?
    let bearings: [Int]?
    let location: [Double]?

    init(out: Int?, entry: [Bool]?, bearings: [Int]?, location: [Double]?) {
        self.out = out
        self.entry = entry
        self.bearings = bearings
        self.location = location
    }
}

// MARK: Intersection convenience initializers and mutators

extension Intersection {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Intersection.self, from: data)
        self.init(out: me.out, entry: me.entry, bearings: me.bearings, location: me.location)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        out: Int?? = nil,
        entry: [Bool]?? = nil,
        bearings: [Int]?? = nil,
        location: [Double]?? = nil
    ) -> Intersection {
        return Intersection(
            out: out ?? self.out,
            entry: entry ?? self.entry,
            bearings: bearings ?? self.bearings,
            location: location ?? self.location
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Maneuver
class Maneuver: Codable {
    let bearingAfter, bearingBefore: Int?
    let location: [Double]?
    let modifier: String?
    let type: PrimaryType?
    let instruction: String?
    let exit: Int?

    enum CodingKeys: String, CodingKey {
        case bearingAfter
        case bearingBefore
        case location, modifier, type, instruction, exit
    }

    init(bearingAfter: Int?, bearingBefore: Int?, location: [Double]?, modifier: String?, type: PrimaryType?, instruction: String?, exit: Int?) {
        self.bearingAfter = bearingAfter
        self.bearingBefore = bearingBefore
        self.location = location
        self.modifier = modifier
        self.type = type
        self.instruction = instruction
        self.exit = exit
    }
}

// MARK: Maneuver convenience initializers and mutators

extension Maneuver {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Maneuver.self, from: data)
        self.init(bearingAfter: me.bearingAfter, bearingBefore: me.bearingBefore, location: me.location, modifier: me.modifier, type: me.type, instruction: me.instruction, exit: me.exit)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        bearingAfter: Int?? = nil,
        bearingBefore: Int?? = nil,
        location: [Double]?? = nil,
        modifier: String?? = nil,
        type: PrimaryType?? = nil,
        instruction: String?? = nil,
        exit: Int?? = nil
    ) -> Maneuver {
        return Maneuver(
            bearingAfter: bearingAfter ?? self.bearingAfter,
            bearingBefore: bearingBefore ?? self.bearingBefore,
            location: location ?? self.location,
            modifier: modifier ?? self.modifier,
            type: type ?? self.type,
            instruction: instruction ?? self.instruction,
            exit: exit ?? self.exit
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Profile: String, Codable {
    case driving = "driving"
}

// MARK: - VoiceInstruction
class VoiceInstruction: Codable {
    let distanceAlongGeometry: Double?
    let announcement, ssmlAnnouncement: String?

    init(distanceAlongGeometry: Double?, announcement: String?, ssmlAnnouncement: String?) {
        self.distanceAlongGeometry = distanceAlongGeometry
        self.announcement = announcement
        self.ssmlAnnouncement = ssmlAnnouncement
    }
}

// MARK: VoiceInstruction convenience initializers and mutators

extension VoiceInstruction {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(VoiceInstruction.self, from: data)
        self.init(distanceAlongGeometry: me.distanceAlongGeometry, announcement: me.announcement, ssmlAnnouncement: me.ssmlAnnouncement)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        distanceAlongGeometry: Double?? = nil,
        announcement: String?? = nil,
        ssmlAnnouncement: String?? = nil
    ) -> VoiceInstruction {
        return VoiceInstruction(
            distanceAlongGeometry: distanceAlongGeometry ?? self.distanceAlongGeometry,
            announcement: announcement ?? self.announcement,
            ssmlAnnouncement: ssmlAnnouncement ?? self.ssmlAnnouncement
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - RouteOptions
class RouteOptions: Codable {
    let baseURL: String?
    let user: String?
    let profile: Profile?
    let coordinates: [[Double]]?
    let language, bearings: String?
    let continueStraight, roundaboutExits: Bool?
    let geometries, overview: String?
    let steps: Bool?
    let annotations: String?
    let voiceInstructions, bannerInstructions: Bool?
    let voiceUnits, accessToken, requestUUID: String?

    enum CodingKeys: String, CodingKey {
        case baseURL
        case user, profile, coordinates, language, bearings, continueStraight, roundaboutExits, geometries, overview, steps, annotations, voiceInstructions, bannerInstructions, voiceUnits, accessToken
        case requestUUID
    }

    init(baseURL: String?, user: String?, profile: Profile?, coordinates: [[Double]]?, language: String?, bearings: String?, continueStraight: Bool?, roundaboutExits: Bool?, geometries: String?, overview: String?, steps: Bool?, annotations: String?, voiceInstructions: Bool?, bannerInstructions: Bool?, voiceUnits: String?, accessToken: String?, requestUUID: String?) {
        self.baseURL = baseURL
        self.user = user
        self.profile = profile
        self.coordinates = coordinates
        self.language = language
        self.bearings = bearings
        self.continueStraight = continueStraight
        self.roundaboutExits = roundaboutExits
        self.geometries = geometries
        self.overview = overview
        self.steps = steps
        self.annotations = annotations
        self.voiceInstructions = voiceInstructions
        self.bannerInstructions = bannerInstructions
        self.voiceUnits = voiceUnits
        self.accessToken = accessToken
        self.requestUUID = requestUUID
    }
}

// MARK: RouteOptions convenience initializers and mutators

extension RouteOptions {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(RouteOptions.self, from: data)
        self.init(baseURL: me.baseURL, user: me.user, profile: me.profile, coordinates: me.coordinates, language: me.language, bearings: me.bearings, continueStraight: me.continueStraight, roundaboutExits: me.roundaboutExits, geometries: me.geometries, overview: me.overview, steps: me.steps, annotations: me.annotations, voiceInstructions: me.voiceInstructions, bannerInstructions: me.bannerInstructions, voiceUnits: me.voiceUnits, accessToken: me.accessToken, requestUUID: me.requestUUID)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        baseURL: String?? = nil,
        user: String?? = nil,
        profile: Profile?? = nil,
        coordinates: [[Double]]?? = nil,
        language: String?? = nil,
        bearings: String?? = nil,
        continueStraight: Bool?? = nil,
        roundaboutExits: Bool?? = nil,
        geometries: String?? = nil,
        overview: String?? = nil,
        steps: Bool?? = nil,
        annotations: String?? = nil,
        voiceInstructions: Bool?? = nil,
        bannerInstructions: Bool?? = nil,
        voiceUnits: String?? = nil,
        accessToken: String?? = nil,
        requestUUID: String?? = nil
    ) -> RouteOptions {
        return RouteOptions(
            baseURL: baseURL ?? self.baseURL,
            user: user ?? self.user,
            profile: profile ?? self.profile,
            coordinates: coordinates ?? self.coordinates,
            language: language ?? self.language,
            bearings: bearings ?? self.bearings,
            continueStraight: continueStraight ?? self.continueStraight,
            roundaboutExits: roundaboutExits ?? self.roundaboutExits,
            geometries: geometries ?? self.geometries,
            overview: overview ?? self.overview,
            steps: steps ?? self.steps,
            annotations: annotations ?? self.annotations,
            voiceInstructions: voiceInstructions ?? self.voiceInstructions,
            bannerInstructions: bannerInstructions ?? self.bannerInstructions,
            voiceUnits: voiceUnits ?? self.voiceUnits,
            accessToken: accessToken ?? self.accessToken,
            requestUUID: requestUUID ?? self.requestUUID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - BaatoWaypoint
class BaatoWaypoint: Codable {
    let name: String?
    let location: [Double]?

    init(name: String?, location: [Double]?) {
        self.name = name
        self.location = location
    }
}

// MARK: BaatoWaypoint convenience initializers and mutators

extension BaatoWaypoint {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(BaatoWaypoint.self, from: data)
        self.init(name: me.name, location: me.location)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String?? = nil,
        location: [Double]?? = nil
    ) -> BaatoWaypoint {
        return BaatoWaypoint(
            name: name ?? self.name,
            location: location ?? self.location
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
