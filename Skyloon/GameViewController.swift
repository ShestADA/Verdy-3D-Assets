import SceneKit
import AppKit

class GameViewController: NSViewController {
    var sceneView: SCNView!
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 1280, height: 720))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create and configure the SceneKit view
        sceneView = SCNView(frame: view.bounds)
        sceneView.autoresizingMask = [.width, .height]
        sceneView.backgroundColor = NSColor.black
        sceneView.allowsCameraControl = true
        view.addSubview(sceneView)
        
        // Create a new scene
        let scene = SCNScene(named: "craft.dae") ?? SCNScene()
        sceneView.scene = scene
        
        // Create and add a camera node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 30)
        scene.rootNode.addChildNode(cameraNode)
        sceneView.pointOfView = cameraNode
        
        // Add lighting
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 15, z: 15)
        scene.rootNode.addChildNode(lightNode)
        
        // Add ambient light
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = NSColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        
        // Add a test sphere
        let sphere = SCNSphere(radius: 2)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = NSColor.red
        sphere.firstMaterial = sphereMaterial
        
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(x: 0, y: 0, z: 0)
        scene.rootNode.addChildNode(sphereNode)
        
        // Add a floor plane
        let floor = SCNPlane(width: 100, height: 100)
        let floorNode = SCNNode(geometry: floor)
        floorNode.position = SCNVector3(x: 0, y: -5, z: 0)
        floorNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: .pi/2)
        let floorMaterial = SCNMaterial()
        floorMaterial.diffuse.contents = NSColor.gray
        floor.firstMaterial = floorMaterial
        scene.rootNode.addChildNode(floorNode)
    }
}
