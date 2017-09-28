%来源:http://adrianboeing.blogspot.com/2012/05/dynamic-window-algorithm-motion.html
BEGIN DWA(robotPose,robotGoal,robotModel)
   laserscan = readScanner()
   allowable_v = generateWindow(robotV, robotModel)
   allowable_w  = generateWindow(robotW, robotModel)
   for each v in allowable_v
      for each w in allowable_w
      dist = find_dist(v,w,laserscan,robotModel)
      breakDist = calculateBreakingDistance(v)
      if (dist > breakDist)  //can stop in time
         heading = hDiff(robotPose,goalPose, v,w) 
          %clearance与原论文稍不一样
         clearance = (dist-breakDist)/(dmax - breakDist) 
         cost = costFunction(heading,clearance, abs(desired_v - v))
         if (cost > optimal)
            best_v = v
            best_w = w
            optimal = cost
    set robot trajectory to best_v, best_w
END
