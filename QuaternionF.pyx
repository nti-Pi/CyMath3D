from libc.math cimport *
from TWiW.Math.Vector3F cimport Vector3F


cdef class QuaternionF(object):
    def __cinit__(self, float s = 1.0, Vector3F v = Vector3F(0, 0, 0)):
        self.s = s
        self.v = v
    
    def __init__(self, s: float = 1.0, v: Vector3F = Vector3F.zero()):
        pass
    
    def __str__(self):
        return 'QuaternionF(s: {0}, v: {1})'.format(self.s, str(self.v))

    def __add__(QuaternionF q1, QuaternionF q2):
        return QuaternionF(q1.s + q2.s, q1.v + q2.v)

    def __mul__(QuaternionF q1, QuaternionF q2):
        return QuaternionF(q1.s * q2.s - q1.v.dot(q2.v), q1.s * q2.v + q2.s * q1.v + q1.v.cross(q2.v))

    cdef Vector3F rotate_vector(QuaternionF self, Vector3F v, Vector3F point_of_rotation):
        return (self * QuaternionF(0, v - point_of_rotation) * self.inverse()).v + point_of_rotation

    @staticmethod
    def from_angle_axis(Vector3F v, float angle_degrees):
        v.normalize()
        cdef float h_angle_radians = angle_degrees * (M_PI / 180.0) * 0.5
        return QuaternionF(cos(h_angle_radians), sin(h_angle_radians) * v)

    @staticmethod
    def from_euler_angles(float x, float y, float z):
        return QuaternionF.from_angle_axis(Vector3F(1, 0, 0), x) * \
               QuaternionF.from_angle_axis(Vector3F(0, 1, 0), y) * \
               QuaternionF.from_angle_axis(Vector3F(0, 1, 0), z)
            
    @staticmethod
    def identity(): return QuaternionF(1.0, Vector3F.zero())
