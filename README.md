# Baato-iOS-Example

<div style="max-width:600px;">

This is an example for integrating baato in iOS app for iOS version 9.0 and above.

This example is tested with the following mapbox pod configuration. Please be sure the pod for mapbox are compatible with iOS version 9.0 and above.

</div>
<pre><code class="language-swift">
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
source 'https://github.com/baato/BaatoPodSpec.git'
source 'https://github.com/CocoaPods/Specs.git'
target 'Baato iOS Example' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Baato iOS Example
  pod 'MaterialComponents/Snackbar'
  pod 'BaatoSwift', '~> 0.2.1'
  # Pods for baato-navigation
  pod 'Mapbox-iOS-SDK', '~> 5.2'
  pod 'MapboxNavigation', '~> 0.37.0'

  target 'Baato iOS ExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Baato iOS ExampleUITests' do
    # Pods for testing
  end
end
</code></pre>

## Setting up example app in xcode
1. Clone the Baato-iOS-Example repo.
2. Open the example folder and install pod. (i.e, pod install)
3. Make a class to store Baato Access token so, that it can be accessed from anywhere
   for eg.
   <pre><code class="language-swift">
    import Foundation
    class Constant {
      static let key = "Baato Public Key"
       //Which can be accessed with Constant.key inside the project
    }   
    </code></pre>
 4. Add the following setting in info.plist of main target for locating user and to use navigation service
    1. Key: Privacy - Location When In Use Usage Description
       Type: String
       Value: "Shows your location on the map: Reason why you need this feature."
    2. Go to project target -> Signing & Capabilities, add the following Background Modes from Capability
        1. Audio, Airplay, and Picture in Picture
        2. Location updates
    3. If you wish to remove mapbox info from map than use:
        Key: MGLMapboxMetricsEnabledSettingShownInApp
        Type: Boolean
        Value: 1
 6. The example app should run, but will be crashed while starting navigation so unlock and override assertion:
      The xcode error pointer will auto point to assertion which is inside: Pods/MapboxDirections.swift/Sources/MapboxDirections/MBDirections.swift
     <pre><code class="language-swift">
       @objc public init(accessToken: String?, host: String?) {
    //Only add this either remove or comment mapbox assertion
        self.accessToken = "pk.xxx"
        apiEndpoint = URL(string: "https://api.baato.io")!
    }
     </code></pre>
     
     Also remove assertion from Pods/MapboxCoreNavigation/MapboxCoreNavigation/NavigationEventsManager.swift as
      <pre><code class="language-swift">
     lazy var accessToken: String = {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
        let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
        let token = dict["MGLMapboxAccessToken"] as? String else {
            //comment or remove assertion failure
                        return ""
              }
                    return token
         }()
        </code></pre>
       
 All done, test the example app.
 
 >Note: Please use ResType.swift i.e, https://github.com/Bhawak/Baato-iOS-Example/blob/master/Baato%20iOS%20Example/Model/ResType.swift for decoding mapbox type direction response.  
 
 ## Tips for integrating Baato to iOS app.
 
 ### 1. Adding baato map with mapbox
  Use MGLMapViewDelegate extension and add baato url to mapview in viewDidLoad as
  <pre><code class="language-swift">
   override func viewDidLoad(){
        super.viewDidLoad()
        var mView: MGLMapView!
        let url = https://api.baato.io/api/v1/styles/breeze?key= + "your baato token"
        mView = MGLMapView(frame: view.bounds, styleURL: url)
        mView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //setting center to Kathmandu
        mView.setCenter(CLLocationCoordinate2D(latitude: 27.7172, longitude: 85.3240), zoomLevel: 12, animated: false)
        
        mView.delegate = self
        mView.logoView.image = UIImage(named: "BaatoLogo")
        mView.logoView.tintColor = UIColor.init(red: 8/255, green: 127/255, blue: 82/255, alpha: 1.0)
        mView.logoViewMargins = CGPoint.init(x: 5, y: 10)
        
        //You must add MGLMapboxMetricsEnabledSettingShownInApp to yes in info.plist to remove mapbox attribution 
        mView.attributionButton.isHidden = true
       
        mView.logoViewPosition = .bottomLeft
        view.addSubview(mView)
        }
   </code></pre>
   
  ### 2.Initializing navigation component 
  Use NavigationMapViewDelegate and NavigationViewControllerDelegate extension to the viewcontroller
  <pre><code class="language-swift">
  class ViewController: UIViewController, MGLMapViewDelegate, NavigationMapViewDelegate  {
      // Initializing parameter for navigation
      let mytStyle = DayStyle()
      var navigationViewController: NavigationViewController?
      var navigationService: NavigationService!
      var route: Route!
      var router: LegacyRouteController!
      var startPoint = MGLPointAnnotation()
      var endPoint = MGLPointAnnotation()
      override func viewDidLoad(){
        super.viewDidLoad()
        let url = URL(string: defStyle + "Baato access token")
        //set mapstyle for navigation mapview
        mytStyle.mapStyleURL = url!
       }
  }
  extension ViewController: NavigationViewControllerDelegate {
     // Reroute from custom server and map progress tacker
  }
</code></pre>

### 3.Requesting route and showing in app

<pre><code class="language-swift">
  let apis = BaatoSwift.API.init(baseURL: "https://api.baato.io/api/v1", token: "Baato Key")
  apis.startLat = startPoint.coordinate.latitude
  apis.startLon = startPoint.coordinate.longitude
  apis.destLat = point.coordinate.latitude
  apis.destLon = point.coordinate.longitude
  apis.navMode = BaatoSwift.NavigationMode.car
  apis.navInstructions = true
           
  //Requesting route and showing from direction API if turn by turn is not necessary
 
  apis.getDirections { (result) in
                switch result {
                case .success(let navData):
                    guard  let navData = navData else {
                        return
                    }
                    let routeString = navData[0].encodedPolyline

                    guard let style = self.mView.style else { return }
                    if(style.source(withIdentifier: "polyline") != nil) {
                        // First remove layer than source for updating
                        style.removeLayer(style.layer(withIdentifier: "polyline")!)
                        style.removeSource(style.source(withIdentifier: "polyline")!)
                    }
                    //BaatoSwift DecoderPoly class decodes route string to coordinate
                    let coordinates = BaatoSwift.DecoderPoly.decodePoints(routeString)
                    let shape = MGLPolyline(coordinates: coordinates, count: UInt(coordinates.count))
                    let source = MGLShapeSource(identifier: "polyline", shape: shape, options: nil)
                    style.addSource(source)
                            // Create new layer for the line.
                    let layer = MGLLineStyleLayer(identifier: "polyline", source: source)
                    layer.lineColor = NSExpression(forConstantValue: UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1))
                    layer.lineWidth = NSExpression(format: "mgl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)",
                                                   [14: 3, 18: 3])
                    style.addLayer(layer)

                case .failure (let error) :
                    print(error.localizedDescription)
                    self.mapError(error: error)
                }
            }

       //Requesting route and showing from Mapboxdirections API for turn by turn.
                apis.getMapboxDirections{(result) in
                  switch result {
                  case .success (let data):
                      guard let data = data else {
                          return
                      }

                      let origin = Waypoint(coordinate: self.startPoint.coordinate, name: "Origin")
                      let destination = Waypoint(coordinate: self.point.coordinate, name: "Destination")
                      self.routeOptions = NavigationRouteOptions(waypoints: [origin, destination])

                  // Set locale so that it takes kilometer/meter(metric), default or "en" takes imperial
                      self.routeOptions!.locale = Locale.init(identifier: "ne")
                      self.routeOptions!.distanceMeasurementSystem = .metric

                      do {
                          let decoder = JSONDecoder()
                          //You need to use ResType class and is inside Model folder of this repo
                          guard let value = try? decoder.decode(ResType.self, from: data) else {
                                  print("Error parsing JSON")
                                  return
                              }
                          let mValue = value.data?.routes?.first
                          let mData = try mValue?.jsonString() 

                          let mEro = Route.init(json: self.convertToDictionary(text: mData!)!, waypoints:[origin, destination], options: self.routeOptions!)
                          self.route = mEro
                          //Route computed prepare navigation service and start
                          self.startNavigation(startPoint: self.startPoint, endPoint: self.point)

                         } catch {
                             print("JSONSerialization error:", error)
                         }

                  case .failure (let error) :
                      print(error.localizedDescription)
                      self.mapError(error: error)
                   }
              }
  </code></pre>
    
### 4. Setting turn by turn navigation
  <pre><code class="language-swift">
    
      private func startNavigation(startPoint: MGLPointAnnotation, endPoint: MGLPointAnnotation){

        navigationService = MapboxNavigationService(route: self.route, directions: nil, locationSource: nil, eventsManagerType: nil, simulating: .onPoorGPS, routerType: LegacyRouteController.self)

        router = LegacyRouteController(along: self.route, dataSource: navigationService)


       let navigationOptions = NavigationOptions(styles: [mytStyle], navigationService: navigationService)

        self.navigationViewController = NavigationViewController(for: route, options: navigationOptions)
        self.navigationViewController?.modalPresentationStyle = .fullScreen
        self.navigationViewController?.delegate = self

        self.navigationViewController?.showsReportFeedback = false
        self.navigationViewController?.mapView?.logoView.image = UIImage(named: "BaatoLogo")
        self.navigationViewController?.mapView?.attributionButton.isHidden = true
        self.present(self.navigationViewController!, animated: false, completion: nil)
    }
 </code></pre>
    
    
### 5. Implemeting off-Route Computation for navigation with baato
    
 <pre><code class="language-swift">
    extension ViewController: NavigationViewControllerDelegate {
    // Never reroute internally. Instead,
    // 1. Fetch a route from your server
    // 2. Map Match the coordinates from your server
    // 3. Set the route on your server
    func navigationViewController(_ navigationViewController: NavigationViewController, shouldRerouteFrom location: CLLocation) -> Bool {

        // Here, we are simulating a custom server.
        let routeOptions = NavigationRouteOptions(waypoints: [Waypoint(location: location), self.routeOptions!.waypoints.last!])
        let startPoint = MGLPointAnnotation()
        guard let userLocation = self.mView.userLocation else {
            return false
        }
        startPoint.coordinate = userLocation.coordinate
        startPoint.title = "Origin"

        apis.startLat = startPoint.coordinate.latitude
        apis.startLon = startPoint.coordinate.longitude
        apis.destLat = point.coordinate.latitude
        apis.destLon = point.coordinate.longitude

        apis.getMapboxDirections{(result) in
            self.manager.dismissAndCallCompletionBlocks(withCategory: .none)
                        switch result {
                        case .success (let data):
                            guard let data = data else {
                                return
                            }

                            let origin = Waypoint(coordinate: self.startPoint.coordinate, name: "Origin")
                            let destination = Waypoint(coordinate: self.point.coordinate, name: "Destination")
                             let routeOptions = NavigationRouteOptions(waypoints: [origin, destination])
                            routeOptions.distanceMeasurementSystem = .metric

                            do {
                                let decoder = JSONDecoder()
                                guard let value = try? decoder.decode(ResType.self, from: data) else {
                                        print("Error parsing JSON")
                                        return
                                    }
                                let mValue = value.data?.routes?.first
                                let mData = try mValue?.jsonString()
                               let mRoute = Route.init(json: self.convertToDictionary(text: mData!)!, waypoints:[origin, destination], options: routeOptions)

                                let router = self.navigationService.router! as! LegacyRouteController
                                self.router = router

                                let routeProgress = RouteProgress(route: mRoute)
                                self.router.routeProgress = routeProgress

                               } catch {
                                   print("JSONSerialization error:", error)
                               }
                        case .failure (let error) :
                            print(error.localizedDescription)
                        }
        }
        return false
    }

    func navigationViewController(_ navigationViewController: NavigationViewController, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        self.navigationViewController?.mapView?.updateCourseTracking(location: location)
    }
    func navigationViewControllerDidDismiss(_ navigationViewController: NavigationViewController, byCanceling canceled: Bool) {
        navigationService.stop()
        dismiss(animated: true, completion: nil)
    }
  }
 </code></pre>
