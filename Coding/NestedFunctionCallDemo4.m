function NestedFunctionCallDemo4
Nested1(5);
    function Nested1(x1)
        disp(['Nested1 ִ�У����룺',num2str(x1)]);
        Nested11(6)
        function Nested11(x2)
            disp(['Nested11 ִ�У�����',num2str(x2)]);
            Nested2(pi)
        end
    end
    function Nested2(y1)
        disp(['Nested2 ִ�У����룺',num2str(y1)]);
        Nested22(2);
        function Nested22(y2)
            disp(['Nested22 ִ�У����룺',num2str(y2)]);
        end
    end
end
            
        
        