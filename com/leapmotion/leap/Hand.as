package com.leapmotion.leap
{
	/**
	 * The Hand class reports the physical characteristics of a detected hand.
	 * 
	 * Hand tracking data includes a palm position and velocity; vectors for
	 * the palm normal and direction to the fingers; properties of a sphere fit
	 * to the hand; and lists of the attached fingers and tools.
	 * 
	 * Note that Hand objects can be invalid, which means that they do not
	 * contain valid tracking data and do not correspond to a physical entity.
	 * Invalid Hand objects can be the result of asking for a Hand object using
	 * an ID from an earlier frame when no Hand objects with that ID exist in
	 * the current frame. A Hand object created from the Hand constructor is
	 * also invalid. Test for validity with the Hand::isValid() function.
	 *  
	 * @author logotype
	 * 
	 */
	public class Hand
	{
		/**
		 * The direction from the palm position toward the fingers.  
		 */		
		public var direction:Vector3;

		/**
		 * The Finger object with the specified ID attached to this hand. 
		 * @see Finger 
		 */		
		public var finger:Finger;

		/**
		 * The list of Finger objects detected in this frame that are attached to this hand, given in arbitrary order.  
		 */
		public var fingers:Vector.<Pointable> = new Vector.<Pointable>();
		
		/**
		 * The Frame associated with this Hand.
		 * @see Frame 
		 */
		public var frame:Frame;

		/**
		 * A unique ID assigned to this Hand object, whose value remains the same across consecutive frames while the tracked hand remains visible. 
		 */
		public var id:Number;

		/**
		 * The normal vector to the palm.  
		 */
		public var palmNormal:Vector3;
		
		/**
		 * The center position of the palm in millimeters from the Leap origin.  
		 */
		public var palmPosition:Vector3;
		
		/**
		 * The rate of change of the palm position in millimeters/second.  
		 */
		public var palmVelocity:Vector3;
		/**
		 * The Pointable object with the specified ID associated with this hand.
		 */
		public var pointable:Pointable;

		/**
		 * The center of a sphere fit to the curvature of this hand.  
		 */
		public var sphereCenter:Vector3;
		/**
		 * The radius of a sphere fit to the curvature of this hand.  
		 */
		public var sphereRadius:Number;
		
		public var r:Vector.<Vector3> = new Vector.<Vector3>();
		public var s:Number;
		public var t:Vector3;

		public function Hand()
		{
		}
		
		/**
		 * Reports whether this is a valid Hand object.  
		 * @return true if all Vectors are valid
		 * 
		 */
		public function isValid():Boolean
		{
			var returnValue:Boolean = true;
			
			if ( !direction.isValid())
				returnValue = false;
			
			if ( !palmNormal.isValid())
				returnValue = false;
			
			if ( !palmPosition.isValid())
				returnValue = false;
			
			if ( !palmVelocity.isValid())
				returnValue = false;
			
			if ( !sphereCenter.isValid())
				returnValue = false;
			
			return returnValue;
		}
	}
}