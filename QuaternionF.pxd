from libc.math cimport *
from TWiW.Math.Vector3F cimport Vector3F


cdef class QuaternionF(object):
    cdef Vector3F v
    cdef float    s
    
    cdef inline float sqr_magnitude(self): return self.v.sqr_magnitude() + self.s * self.s
    cdef inline float magnitude(self): return sqrt(self.sqr_magnitude())

    cdef inline QuaternionF conjugate(self): return QuaternionF(self.s, -1 * self.v)
    cdef inline QuaternionF inverse(self): return self.conjugate() / self.sqr_magnitude()
        
    cdef inline void normalize(self):
        cdef float magnitude = self.magnitude()
    
        self.v.x /= magnitude
        self.v.y /= magnitude
        self.v.z /= magnitude
        self.s   /= magnitude
    
    cdef Vector3F rotate_vector(QuaternionF self, Vector3F v, Vector3F point_of_rotation)
