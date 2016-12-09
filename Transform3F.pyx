from TWiW.Math.Vector3F import Vector3F
from TWiW.Math.QuaternionF import QuaternionF


cdef class Transform3F(object):
    def __cinit__(self, QuaternionF rotation, Vector3F position):
        self.position = position
        self.rotation = rotation

    def __init__(self, rotation, position):
        super().__init__()
    