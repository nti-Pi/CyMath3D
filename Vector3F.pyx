cdef class Vector3F(object):

    def __cinit__(self, float x, float y, float z):
        self.x = x
        self.y = y
        self.z = z    
    
    def __init__(self, x, y, z):
        super().__init__()

    def __getitem__(self, i):
        return [self.x, self.y, self.z][i]

    def __str__(self):
        return 'Vector3F(x: {0}, y: {1}, z: {2})'.format(self.x, self.y, self.z)

    def __add__(Vector3F v1, Vector3F v2):
        return Vector3F(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
    
    def __sub__(Vector3F v1, Vector3F v2):
        return Vector3F(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
    
    def __mul__(float s, Vector3F v):
        return Vector3F(v.x * s, v.y * s, v.z * s)
    
    @staticmethod
    def zero(): return Vector3F(0, 0, 0)
    
    # Right-handed coordinate system:
    
    @staticmethod
    def u_right(): return Vector3F(1, 0, 0)
    
    @staticmethod
    def u_left(): return Vector3F(-1, 0, 0)
    
    @staticmethod
    def u_up(): return Vector3F(0, 1, 0)
    
    @staticmethod
    def u_down(): return Vector3F(0, -1, 0)
    
    @staticmethod
    def u_back(): return Vector3F(0, 0, 1)
    
    @staticmethod
    def u_front(): return Vector3F(0, 0, -1)
