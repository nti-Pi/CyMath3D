from TWiW.Math.Vector3F cimport Vector3F
from TWiW.Math.QuaternionF cimport QuaternionF


cdef class Transform3F(object):
    cdef Vector3F position
    cdef QuaternionF rotation
