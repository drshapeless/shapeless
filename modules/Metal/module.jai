#scope_export
#load "enum.jai";
#load "struct.jai";
#load "typedef.jai";
#load "function.jai";
#load "var.jai";
#load "selectors.jai";
#load "protocol.jai";
#load "interface.jai";

init_metal :: () {
    if __sel.layer return;

    init_objective_c_selector_struct(*__sel);
}

// Both kern_return_t and task_id_token_t are generated directly into
// its underlying type using canonical type in libclang.
//
// kern_return_t :: s64;
// task_id_token_t :: u64;

// Here are the inline function written by hand, most of them are useless in Jai.
MTLOriginMake :: inline (x: NSUInteger, y: NSUInteger, z: NSUInteger) -> MTLOrigin {
    return MTLOrigin.{x, y, z};
}

MTLSizeMake :: inline (width: NSUInteger, height: NSUInteger, depth: NSUInteger) -> MTLSize {
    return MTLSize.{width, height, depth};
}

MTLRegionMake1D :: inline (x: NSUInteger, width: NSUInteger) -> MTLRegion {
    region: MTLRegion;
    region.origin = .{x, 0, 0};
    region.size = .{width, 1, 1};
    return region;
}

MTLRegionMake2D :: inline (x: NSUInteger, y: NSUInteger, width: NSUInteger, height: NSUInteger) -> MTLRegion {
    region: MTLRegion;
    region.origin = .{x, y, 0};
    region.size = .{width, height, 1};
    return region;
}

MTLRegionMake2D :: inline (x: NSUInteger, y: NSUInteger, z: NSUInteger, width: NSUInteger, height: NSUInteger, depth: NSUInteger) -> MTLRegion {
    region: MTLRegion;
    region.origin = .{x, y, z};
    region.size = .{width, height, depth};
    return region;
}

MTLSamplePositionMake :: inline (x: float, y: float) -> MTLSamplePosition {
    return .{x, y};
}

MTLCoordinate2DMake :: inline (x: float, y: float) -> MTLCoordinate2D {
    return .{x, y};
}

MTLTextureSwizzleChannelsMake :: inline (r: MTLTextureSwizzle, g: MTLTextureSwizzle, b: MTLTextureSwizzle, a: MTLTextureSwizzle) -> MTLTextureSwizzleChannels {
    return .{r, g, b, a};
}

MTLClearColorMake :: inline (red: float64, green: float64, blue: float64, alpha: float64) -> MTLClearColor {
    return .{red, green, blue, alpha};
}

MTL4BufferRangeMake :: inline (bufferAddress: MTLGPUAddress, length: u64) -> MTL4BufferRange {
    return .{bufferAddress, length};
}

// These structs are not auto-generated, they are in MTLAccelerationStructureTypes.h
MTLPackedFloat3 :: Math.Vector3;
MTLPackedFloat4x3 :: Math.Matrix4x3;

MTLPackedFloat3Make :: inline (x: float, y: float, z: float) -> MTLPackedFloat3 {
    return .{x, y, z};
}

MTLPackedFloatQuaternionMake :: inline (x: float, y: float, z: float, w: float) -> MTLPackedFloatQuaternion {
    return .{x, y, z, w};
}

MTLAxisAlignedBoundingBox :: struct {
    min: MTLPackedFloat3;
    max: MTLPackedFloat3;
}

MTLIndirectCommandBufferExecutionRangeMake :: inline (location: u32, length: u32) -> MTLIndirectCommandBufferExecutionRange {
    return .{location, length};
}

// These are something that should not be included here.
CGColorSpaceRef :: *void;
CAEDRMetadata :: NSObject;
IOSurfaceRef :: *void;
NSNumber :: NSObject;
NSErrorDomain :: *NSString;
NSErrorUserInfoKey :: *NSString;

#scope_module
#import "Objective_C";
#import "macOS";
Metal :: #library,system,link_always "Metal";
QuartzCore :: #library,system,link_always "QuartzCore";
Math :: #import "Math";
