from libc.math cimport *


cdef class Vector3F(object):
    cdef float x
    cdef float y
    cdef float z
    
    cdef inline float sqr_magnitude(self): return self.x * self.x + self.y * self.y + self.z * self.z
    
    cdef inline float magnitude(self): return sqrt(self.sqr_magnitude())
    
    cdef inline void normalize(self):
        cdef float magnitude = self.magnitude()
        self.x /= magnitude
        self.y /= magnitude
        self.z /= magnitude
        
    cdef inline float dot(Vector3F v1, Vector3F v2):
        return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z

    cdef inline Vector3F cross(Vector3F v1, Vector3F v2):
        return Vector3F(v1.y * v2.z - v1.z * v2.y,
                        v1.z * v2.x - v1.x * v2.z,
                        v1.x * v2.y - v2.x * v1.y)
